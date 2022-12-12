FROM alpine:latest

RUN apk update && apk add git && apk add openjdk11 && apk add maven
RUN mkdir projects

WORKDIR /root/projects/
RUN git clone https://github.com/jenkins-docs/simple-java-maven-app.git

WORKDIR /root/projects/simple-java-maven-app
RUN mvn validate test package

# WORKDIR /root/projects/simple-java-maven-app/target
# CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
