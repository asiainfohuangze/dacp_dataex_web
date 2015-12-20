FROM ubuntu:14.04

ENV CATALINA_HOME /usr/local/dacp/apache-tomcat-8.0.24/
#RUN mkdir -p "$CATALINA_HOME"
WORKDIR /usr/local/dacp/

RUN apt-get update && apt-get install -y curl

EXPOSE 8080

ENV JAVA_HOME  /usr/local/dacp/jdk1.7.0_67
RUN curl -fSL https://s3.cn-north-1.amazonaws.com.cn/complier/jdk.tar.gz -o jdk.tar.gz\
    && tar -xf jdk.tar.gz

ADD apache-tomcat-8.0.24 /usr/local/dacp/

#VOLUME /usr/local/tomcat/webapps/data       tomcat持久化目录，本次不需要

CMD ["$CATALINA_HOME/bin/startup.sh"]
