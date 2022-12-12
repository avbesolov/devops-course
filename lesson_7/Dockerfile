FROM ubuntu:22.04

LABEL my_app="v3"

RUN apt update && apt upgrade -y && apt install git -y && apt install default-jdk -y && apt install maven -y
RUN mkdir projects

WORKDIR /root/projects/
RUN git clone https://github.com/jenkins-docs/simple-java-maven-app.git

WORKDIR /root/projects/simple-java-maven-app
RUN mvn validate test package

WORKDIR /root/projects/simple-java-maven-app/target
# CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
