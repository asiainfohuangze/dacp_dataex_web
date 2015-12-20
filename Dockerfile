FROM ubuntu

ENV CATALINA_HOME /usr/local/dacp
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

EXPOSE 8080

ENV JAVA_HOME  /usr/local/dacp/jdk1.7.0_67
RUN curl -fSL https://s3.cn-north-1.amazonaws.com.cn/complier/jdk.tar.gz -o jdk.tar.gz\
    && tar -xf jdk.tar.gz


#VOLUME /usr/local/tomcat/webapps/data       tomcat持久化目录，本次不需要

CMD ["./webapps/start.sh"]