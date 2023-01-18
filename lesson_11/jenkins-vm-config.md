1. apt update && apt upgrade -y
2. apt install docker.io
3. docker run -d -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
4. Первоначальная настройка дженкинса. 
Установка дополнительного плагина для работы с контейнером сервлетов - tomcat9 (Deploy to container)
5. Создание джобы с типом pipeline и ее настройка
6. Размещение пайплайна в репозитории - https://github.com/avbesolov/devops-course.git 
папка lesson_11

```Jenkinsfile
pipeline {
    
    agent any
    
    tools {
        maven 'm3'
    }
    
    stages {
        stage ('git clone') {
            steps {
                git 'https://github.com/avbesolov/boxfuse-for-devops-course.git'
            }
        }
        stage ('build app') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('deploy app') {
            steps {
                deploy adapters: [tomcat9(credentialsId: '3797a4cd-1bad-4825-9b17-946f64bdb134', path: '', url: 'http://94.103.89.223:8080/')], contextPath: 'my_pipe_app', war: '**/*.war'
            }
        }
    }
    
}
```

7. Настройка вебхука в репозитории с приложением для деплоя - https://github.com/avbesolov/boxfuse-for-devops-course.git

```http
http://195.2.81.37:8080/github-webhook/
```