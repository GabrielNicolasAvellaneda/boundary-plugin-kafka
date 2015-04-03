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
|:---------|:----------------------------------------------------------|
| KAFKA BYTES OUT PER SEC | Bytes out per second
| KAFKA ISR EXPANDS PER SEC | ISR EXPANDS out per second
| KAFKA PARTITION COUNT | Partition count
| KAFKA LEADER COUNT | Leader count
| KAFKA PURGATORY SIZE | Purgatory size
| KAFKA CONSUMER EXPIRES PER SEC | Consumer expires per second
| KAFKA MAX LAG SIZE | Max lag size
| KAFKA RESPONSE QUEUE SIZE | Response queue size
|                                                                                                                            |
