FROM nzannino/docker-baseimage
MAINTAINER Nicola Zannino <n.zannino@gmail.com>

RUN add-apt-repository ppa:webupd8team/java
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true \
	| /usr/bin/debconf-set-selections
RUN apt-get update && apt-get -y install \
	oracle-java7-installer \
	oracle-java7-set-default \
	oracle-java7-unlimited-jce-policy

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]