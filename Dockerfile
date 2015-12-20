FROM ubuntu:14.04

ENV CATALINA_HOME /usr/local/dacp
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN apt-get date && apt-get intall -y curl

EXPOSE 8080

ENV JAVA_HOME  /usr/local/dacp/jdk1.7.0_67
RUN curl -fSL https://s3.cn-north-1.amazonaws.com.cn/complier/jdk.tar.gz -o jdk.tar.gz\
    && tar -xf jdk.tar.gz

ADD apache-tomcat-8.0.24 apache-tomcat-8.0.24/

#VOLUME /usr/local/tomcat/webapps/data       tomcat持久化目录，本次不需要

CMD ["./apache-tomcat-8.0.24/bin/startup.sh"]
