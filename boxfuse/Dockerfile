FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install git -y && apt install default-jdk -y && apt install maven -y && apt install tomcat9 -y
RUN mkdir projects

WORKDIR /root/projects
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

WORKDIR /root/projects/boxfuse-sample-java-war-hello
RUN mvn package

COPY /target/hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
