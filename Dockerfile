FROM centos:centos7
MAINTAINER paul8263
RUN yum install java-1.8.0-openjdk -y
ENV ZK_HOME=/apache-zookeeper-3.5.5-bin ZK_DATA=/data
ADD apache-zookeeper-3.5.5-bin.tar.gz /
COPY zoo.cfg $ZK_HOME/conf/
COPY run.sh /root/
EXPOSE 2181
VOLUME /data
ENTRYPOINT ["/root/run.sh"]
