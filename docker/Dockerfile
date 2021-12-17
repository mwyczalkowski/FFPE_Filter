FROM openjdk:11-jre-buster
# Note that openjdk:11-jre-bullseye does not run on centos 7 : https://issueexplorer.com/issue/docker-library/postgres/884

MAINTAINER Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
RUN apt-get update
RUN apt-get install -y --no-install-recommends samtools wget
WORKDIR /opt
RUN wget https://github.com/mikdio/SOBDetector/releases/download/v1.0.4/SOBDetector_v1.0.4.jar

COPY . /opt/FFPE_Filter
WORKDIR /opt/FFPE_Filter
