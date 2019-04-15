# Vagrant Kafka Lab

## Web UIs

- Grafana: [http://kafka-lab-3:3000](http://kafka-lab-3:3000)
- Prometheus-UI: [http://kafka-lab-3:9090](http://kafka-lab-3:9090)

## Installation

```bash
git clone https://github.com/me
cd me
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

## Vagrant usage

To log on to servers, use vagrant ssh

``bash
vagrant ssh kafka-lab-2
``
##Prerequistes
Vagrant, VirtualBox, Ansible, vagrant-hostmanager 
