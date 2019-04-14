#!/bin/bash

export JAVA_HOME="/usr/local/jdk1.8.0_131"
/home/vagrant/kafka/bin/kafka-topics.sh --zookeeper kafka-lab-1:2181 --replication-factor 1 --partitions 3 --topic input --create
/home/vagrant/kafka/bin/kafka-topics.sh --zookeeper kafka-lab-1:2181 --replication-factor 1 --partitions 3 --topic output --create

while true; do
	echo `date -u +"%s"` | /home/vagrant/kafka/bin/kafka-console-producer.sh --topic "input" --broker-list "kafka-lab-1:9092"
	sleep 1
done

#echo "Exiting."
