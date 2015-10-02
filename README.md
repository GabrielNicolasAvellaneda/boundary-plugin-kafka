# TrueSight Pulse Kafka Plugin 

Collects metrics from a Kafka broker

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

* Java 1.7 or later.
* This plugin is compatible with Kafka 0.8.2 or later.

#### Boundary Meter versions v4.2 or later

- To install new meter go to Settings->Installation or [see instructions](https://help.boundary.com/hc/en-us/sections/200634331-Installation).
- To upgrade the meter to the latest version - [see instructions](https://help.boundary.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter).

### Plugin Setup

To collect statistics from a Kafka broker you need to enable access to the JMX remote endpoint. For this, run the server specifying the JMX_PORT such as for example:

```
$ JMX_PORT=9990 ./bin/kafka-server-start.sh config/server.properties

```

### Plugin Configuration Fields

|Field Name    | Description                                                                                              |
|:-------------|:---------------------------------------------------------------------------------------------------------|
| Host          | Host of the Kafka JMX endpoint.                |
| Port          | Port of the Kafka JMX endpoint. Defaults to 9990.         |
| Username      | Username of the Kafka JMX endpoint. |
| Password      | Password of the Kafka JMX endpoint. |
| Source        | The Source to display in the legend for the metrics data.  It will default to the hostname of the server.|
| Poll Interval | How often should the plugin poll for metrics. |
| Topics        | List of topics to monitor (optional). You can get global metrics as well as metrics disaggregated by topic. |

### Metrics Collected

|Metric Name                                   |Description                                                               |
|:---------------------------------------------|:-------------------------------------------------------------------------|
| KAFKA_JVM_HEAPMEMORY_USED | Heap Memory Used by the JVM. |
| KAFKA_TOPIC_MESSAGE_IN_RATE | Number of Message In on Topics per second. |
| KAFKA_TOPIC_BYTE_IN_RATE | Number of Bytes In on Topics per second. | 
| KAFKA_TOPIC_BYTE_OUT_RATE | Number of Bytes Out from Topics per second. | 
| KAFKA_PRODUCE_REQUEST_RATE | Number of Requests by Producers per second. |
| KAFKA_CONSUME_REQUEST_RATE | Number of requests by Fetch Consumers per second. |
| KAFKA_FOLLOW_REQUEST_RATE | Number of requests by Fetch Followers per second. |
| KAFKA_PRODUCE_REQUEST_FAILS | Total number of failed Produce Requests.| 
| KAFKA_FETCH_REQUEST_FAILS | Total number of failed Fetch Requests. |
| KAFKA_ISR_SHRINK_RATE | If a brokers goes down, ISR for some of the partitions will shrink. |
| KAFKA_ISR_EXPAND_RATE | Number of ISR expansions per second. |
| KAFKA_PRODUCE_REQUEST_TOTAL_TIME | Total time of Producers requests. |
| KAFKA_CONSUME_REQUEST_TOTAL_TIME | Total time of Fetch Consumers requests. |
| KAFKA_FOLLOW_REQUEST_TOTAL_TIME | Total time of Fetch Followers requests. |
| KAFKA_PRODUCE_REQUEST_RESPONSE_TIME | Total time to send the response to the Producer. |
| KAFKA_CONSUME_REQUEST_RESPONSE_TIME | Total time to send the response to a Consumer. |
| KAFKA_FOLLOW_REQUEST_RESPONSE_TIME | Total time to send the reponse to a Follower. |
| KAFKA_NETWORK_PROCESSOR_IDLE_TIME | The average fraction of time the network processors are idle. |
| KAFKA_REQUEST_HANDLER_THREADS_IDLE_TIME | The average fraction of time the request handler threads are idle. |  
| KAFKA_MESSAGE_CONSUMER_LAG | Number of messages the consumer lags abehind the producer by. |
| KAFKA_LOG_FLUSH_RATE_AND_TIME | Log flush rate. |  
| KAFKA_UNDER_REPLICATED_PARTITIONS | |
| KAFKA_LEADER_ELECTION_RATE | Leader election rate. |
| KAFKA_MAX_LAG_MESSAGES_FOLLOWER_AND_REPLICAS |
| KAFKA_REQUESTS_WAITING_PRODUCER_PURGATORY | Number of request waiting in the producer purgatory |
| KAFKA_PARTITION_COUNT | Number of partitions. |
| KAFKA_LEADER_COUNT | Number of leaders. |
| KAFKA_PRODUCER_REQUEST_PURGATORY_SIZE | Size of the Producer's request purgatory. |
| KAFKA_FETCH_REQUEST_PURGATORY_SIZE | Size of the Fetch's purgatory. |
| KAFKA_FETCH_REQUEST_EXPIRATION_RATE | Expiration rate for fetch requests. |
| KAFKA_PRODUCER_REQUEST_EXPIRATION_RATE | Expiration rate for producer requests. | 
| KAFKA_REQUESTS_WAITING_FETCH_PURGATORY | Number of requests waiting in the fetch purgatory |
| KAFKA_PRODUCER_REQUEST_QUEUE_TOTAL_TIME | Total time of Producer requests waiting in the Request Queue. |
| KAFKA_CONSUMER_REQUEST_QUEUE_TOTAL_TIME | Total time of Fetch Consumers requests waiting in the Request Queue. |
| KAFKA_FOLLOWER_REQUEST_QUEUE_TOTAL_TIME | Total time of Fetch Followers requests waiting in the Request Queue. |
| KAFKA_PRODUCER_REQUEST_LEADER_TOTAL_TIME | Total time of Producer's requests processed at the leader. |
| KAFKA_CONSUMER_REQUEST_LEADER_TOTAL_TIME | Total time of Consumer's requests processed at the leader. |
| KAFKA_FOLLOWER_REQUEST_LEADER_TOTAL_TIME | Total time of Follower's requests processed at the leader. |
| KAFKA_PRODUCER_REQUEST_FOLLOWER_TOTAL_TIME | Total time of Producer's requests waiting for the follower. |
| KAFKA_CONSUMER_REQUEST_FOLLOWER_TOTAL_TIME | Total time of Consumer's requests wiating for the follower. |
| KAFKA_FOLLOWER_REQUEST_FOLLOWER_TOTAL_TIME | Total time of Follower's requests waiting ofr the follower. |
| KAFKA_MESSAGE_CONSUMER_LAG | Number of messages the consumer lags abehind the producer by. |

### Dashboards

- Kafka General

### References

http://kafka.apache.org/documentation.html#monitoring
