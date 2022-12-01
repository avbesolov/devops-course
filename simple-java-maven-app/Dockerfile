FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install git -y && apt install default-jdk -y && apt install maven -y
RUN mkdir projects && cd projects
RUN git clone https://github.com/avbesolov/docker-test-project.git

WORKDIR /root/projects/simple-java-maven-app

RUN mvn package

WORKDIR /root/projects/simple-java-maven-app/target

CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
