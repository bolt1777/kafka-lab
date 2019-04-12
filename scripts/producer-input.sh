#!/bin/bash

export JAVA_HOME="/usr/local/jdk1.8.0_131"
while true; do 
	echo `date -u +"%s"` | /home/vagrant/kafka/bin/kafka-console-producer.sh --topic "input" --broker-list "kafka-lab-1:9092"
	sleep 1
done

#echo "Exiting."

