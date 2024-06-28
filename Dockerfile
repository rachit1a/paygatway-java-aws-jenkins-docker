FROM openjdk:8u151-jdk-alpine3.7

EXPOSE 8070

ENV APP_HOME /root/paygatway-java-aws-jenkins-docker/src/app

WORKDIR /root/paygatway-java-aws-jenkins-docker

ENTRYPOINT exec java -jar app.jar
