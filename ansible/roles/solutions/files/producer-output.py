#!/usr/bin/env python
import threading, logging, time
import multiprocessing
import datetime
import json

from kafka import KafkaConsumer, KafkaProducer


producer = KafkaProducer(bootstrap_servers='kafka-lab-1:9092')
consumer = KafkaConsumer(bootstrap_servers='kafka-lab-1:9092',
                                 auto_offset_reset='earliest')
while True:
        consumer.subscribe(['input'])
        for message in consumer:
                  date = datetime.datetime.fromtimestamp(float(message.value))
                  mdate = date.isoformat("T") + "Z"
                  producer.send('output' , json.dumps(mdate).encode('utf-8'))

