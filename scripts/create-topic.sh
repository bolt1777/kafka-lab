#!/usr/bin/env bash

if [ $# -gt 0 ]; then
    /home/vagrant/kafka/bin/kafka-topics.sh --zookeeper kafka-lab-1:2181 --replication-factor 1 --partitions 3 --topic $1 --create
else
    echo "Usage: "$(basename $0)" <topic_name>"
fi
