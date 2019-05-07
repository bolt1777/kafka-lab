# Vagrant Kafka Lab

## Web UIs

- Grafana: [http://kafka-lab-3:3000](http://kafka-lab-3:3000)
- Prometheus-UI: [http://kafka-lab-3:9090](http://kafka-lab-3:9090)

## Installation

```bash
git clone https://github.com/dmarych/kafka-lab.git
cd kafka-lab
vagrant plugin install vagrant-hostmanager
vagrant up
```

## Grafana

To access Grafana dashboard, use admin/admin login credentials, add Prometheus data source - http://localhost:9090, and load the [dashboard](doc/Kafka-1555313919864.json) provided in the doc folder

## Lab setup:

| IP           | Hostname | Description                         | Settings |
|--------------|----------|-------------------------------------|----------|
| 192.168.10.2 | kafka-lab-1  | ZK, Kafka Broker    			| 3GB RAM  |
| 192.168.10.3 | kafka-lab-2  | Solutions server 		        | 2GB RAM  |
| 192.168.10.4 | kafka-lab-3  | Promeutheus, Grafana            | 2GB RAM  |

## The setup does the following:

- Install and configure Kafka on VM1 (with Ansible)

- Create topics on Kafka 'input', 'output'

- Create solution 1 that produces epoch timestamp in ms to 'input' once per second

- Create solution 2 that consumes from topic 1, transforms input message to date string (RFC 3339), sends to topic 'output'

- Deploy both solutions to VM2. They should both be managed as systems services.

- In VM3 install Prometheus, Grafana. Export Kafka metrics and metric from solutions 1,2 and visualize them in Grafana.

## Vagrant usage

To log on to servers, use vagrant ssh

``
vagrant ssh kafka-lab-2
``

