FROM ubuntu:14.04
MAINTAINER Chelsea Zhang <chelsea@bluelabs.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list; apt-get update; apt-get install -y unzip openjdk-7-jre-headless wget git

RUN wget -q http://www.carfab.com/apachesoftware/kafka/0.8.2-beta/kafka_2.10-0.8.2-beta.tgz -O /tmp/kafka.tgz
RUN tar xfz /tmp/kafka.tgz -C /opt

ADD kafka-statsd-metrics2-0.4.0-SNAPSHOT-all.jar /opt/kafka_2.10-0.8.2-beta/libs/kafka-statsd-metrics.jar

ENV KAFKA_HOME /opt/kafka_2.10-0.8.2-beta

EXPOSE 9092

ADD start-kafka.sh /usr/bin/start-kafka.sh 
CMD start-kafka.sh 
