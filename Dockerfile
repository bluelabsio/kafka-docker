FROM ubuntu:trusty

MAINTAINER Wurstmeister 

ENV KAFKA_VERSION="0.8.2.0" SCALA_VERSION="2.10"

RUN apt-get update && apt-get install -y unzip openjdk-7-jre-headless wget curl git docker.io

ADD download-kafka.sh /tmp/download-kafka.sh
RUN /tmp/download-kafka.sh
RUN tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

EXPOSE 9092

ADD kafka-statsd-metrics2-0.4.0-SNAPSHOT-all.jar ${KAFKA_HOME}/libs/kafka-statsd-metrics.jar

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
CMD start-kafka.sh
