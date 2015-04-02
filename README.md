Boundary Kafka Plugin
-------------------------

Collects metrics from a kafka broker.

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

|  Runtime | LUA/luvit |
|:---------|:-------:|:------:|:----:|
| Required |    +    |        |      |

### Plugin Setup

To collect statistics from kafka, add the following properties to your config/server.properties

```

kafka.metrics.polling.interval.secs=5
kafka.metrics.reporters=kafka.metrics.KafkaCSVMetricsReporter
kafka.csv.metrics.dir=/var/log/kafka/csv_metrics
kafka.csv.metrics.reporter.enabled=true

```



#### Plugin Configuration Fields

|Field Name|Description                                                |
|:---------|:----------------------------------------------------------|
|metricsPath      |The kafka csv metrics dir.                                        |

### Metrics Collected
|Metric Name          |Description                       |
|:--------------------|:--------------------------------                                                                                                                           |
|Nginx Active Connections     |Active connections to nginx                                                                   |
|Nginx Reads                  |Connections with Nginx reading request headers                                                |
|Nginx Writes                 |Connections with Nginx reading request body, processing request or writing response to client.|
|Nginx Waiting                |Keep-alive connections with Nginx in a wait state                                             |
|Nginx Connections Handled    |Connections handled by nginx                                                                  |
|Nginx Connections Not Handled|Connections accepted, but not handled                                                         |
|Nginx Requests               |Requests to nginx                                                                             |
|Nginx Requests per Connection|Requests per handled connections for nginx                                                    |
|                                                                                                                            |
