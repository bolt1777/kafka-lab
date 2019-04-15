#!/bin/bash
export JAVA_HOME="/usr/local/jdk1.8.0_131"

while true; do
/home/vagrant/kafka/bin/kafka-console-consumer.sh --topic input --bootstrap-server kafka-lab-1:9092 | date -u +"%Y-%m-%dT%H:%M:%S-%N" | /home/vagrant/kafka/bin/kafka-console-producer.sh --topic "output" --broker-list "kafka-lab-1:9092"
sleep 1
done
