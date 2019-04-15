#!/usr/bin/env python
import threading, logging, time
import multiprocessing
import datetime
import json

from kafka import KafkaConsumer, KafkaProducer


producer = KafkaProducer(bootstrap_servers='kafka-lab-1:9092')
topic = 'input'
while True:
        timestamp = int(time.time())
        producer.send(topic , json.dumps(timestamp).encode('utf-8'))
        time.sleep(1)

