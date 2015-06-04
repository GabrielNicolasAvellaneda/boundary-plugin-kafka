local timer    = require('timer')
local boundary = require('boundary')
local io       = require('io')
local fs       = require('fs')

local __pgk        = "BOUNDARY KAFKA"
local __ver        = "version 1.0"
local __tags       = "kafka, lua, plugin"
local _previous    = {}
local path         = "/var/log/kafka/csv_metrics"
local pollInterval = 1000
local strictSSL    = true
local source, username, password


if (boundary.param ~= nil) then
  pollInterval       = boundary.param.pollInterval or pollInterval
  path               = boundary.param.path or path
  source             = (type(boundary.param.source) == 'string' and boundary.param.source:gsub('%s+', '') ~= '' and boundary.param.source) or
   io.popen("uname -n"):read('*line')
end


function berror(err)
  if err then print(string.format("_bevent:%s : %s : %s|t:error|tags:%s", __pgk, __ver, tostring(err), __tags)) return err end
end


local files = {
  {"MessagesInPerSec.csv", "KAFKA_MESSAGES_IN_PER_SEC", "count"},
  {"BytesOutPerSec.csv", "KAFKA_BYTES_OUT_PER_SEC", "count"},
  {"BytesOutPerSec.csv", "KAFKA_BYTES_OUT_PER_SEC", "count"},
  {"IsrExpandsPerSec.csv", "KAFKA_ISR_EXPANDS_PER_SEC", "count"},
  {"PartitionCount.csv", "KAFKA_PARTITION_COUNT", "value"},
  {"ConsumerExpiresPerSecond.csv", "KAFKA_CONSUMER_EXPIRES_PER_SECOND", "count"},
  {"LeaderCount.csv", "KAFKA_LEADER_COUNT", "value"},
  {"PurgatorySize.csv", "KAFKA_PURGATORY_SIZE", "value"},
  {"ResponseQueueSize.csv", "KAFKA_RESPONSE_QUEUE_SIZE", "value"},
  {"MaxLag.csv", "KAFKA_MAX_LAG_SIZE", "value"},
}

function parseLine(line,sep)
  local res = {}
  local pos = 1
  sep = sep or ','
  while true do
    local c = string.sub(line,pos,pos)
    if (c == "") then break end
    if (c == '"') then
      -- quoted value (ignore separator within)
      local txt = ""
      repeat
        local startp,endp = string.find(line,'^%b""',pos)
        txt = txt..string.sub(line,startp+1,endp-1)
        pos = endp + 1
        c = string.sub(line,pos,pos)
        if (c == '"') then txt = txt..'"' end
        -- check first char AFTER quoted string, if it is another
        -- quoted string without separator, then append it
        -- this is the way to "escape" the quote char in a quote. example:
        --   value1,"blub""blip""boing",value3  will result in blub"blip"boing  for the middle
      until (c ~= '"')
      table.insert(res,txt)
      assert(c == sep or c == "")
      pos = pos + 1
    else
      -- no quotes used, just look for the first separator
      local startp,endp = string.find(line,sep,pos)
      if (startp) then
        table.insert(res,string.sub(line,pos,startp-1))
        pos = endp + 1
      else
        -- no separator found -> use rest of string and terminate
        table.insert(res,string.sub(line,pos))
        break
      end
    end
  end
  return res
end

function split(str, delim)
   local res = {}
   local pattern = string.format("([^%s]+)%s()", delim, delim)
   while (true) do
      line, pos = str:match(pattern, pos)
      if line == nil then break end
      table.insert(res, line)
   end
   return res
end

function length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

function parseCSV(body)
  local lines = split(body, "\n")
  local head = lines[1]
  local last = lines[length(lines)]
  local r = {}
  for i,v in ipairs(parseLine(head)) do
    r[v] = parseLine(last)[i]
  end
 return r
end


function printStats(desc, v)
  print(string.format('%s %d %s', desc, v, source))
end

print(string.format("_bevent: %s : %s : UP|t:info|tags:%s", __pgk, __ver, __tags))

timer.setInterval(pollInterval, function ()

  for i, file in ipairs(files) do
      fs.readFile(path .. "/" .. file[1], function(err, content)
        if berror(err) then return end
        local r = parseCSV(content)
        printStats(file[2], r[file[3]])
      end)
  end

end)

