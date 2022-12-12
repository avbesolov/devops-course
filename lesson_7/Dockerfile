FROM alpine:latest

RUN apk update && apk upgrade -y && apk add git -y && apk add default-jdk -y && apk add maven -y
RUN mkdir projects

WORKDIR /root/projects/
RUN git clone https://github.com/jenkins-docs/simple-java-maven-app.git

WORKDIR /root/projects/simple-java-maven-app
RUN mvn validate test package

WORKDIR /root/projects/simple-java-maven-app/target
# CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
