# This dockerfile uses the 172.16.6.251/admin/centos7.1-v1-tomcat7-apr image.
# VERSION 1
# Author: walker
# Command format: Instruction [arguments / command] ..

FROM rvm:5100/epg/centos7.1-v1-tomcat7_jdk1.8:v6

MAINTAINER walker walker@fonsview.com

ENV TOPIC metadata
ENV VERSION  1299

# copy packages
ADD FV6200-MS-V6.0.0-$VERSION-SHH-CTCC.tar.gz /tmp

# install
RUN cd /tmp/FV6200-MS-V6.0.0-$VERSION-SHH-CTCC && sh install.sh
ADD context.xml /opt/fonsview/3RD/tomcat7.0.63/conf/context.xml

ADD run.sh /
ENTRYPOINT sh /run.sh

EXPOSE 22 6600
