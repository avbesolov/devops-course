1. apt update
2. apt upgrade -y
3. apt install docker.io
4. docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
5. Первоначальная настройка дженкинса (создание учетки, скачивание необходимых плагинов - ssh, ssh_agent, ansible, hidden_parameter)
6. Создание кредов для подключения по ssh к необходимым тачкам
7. Создание джоб 

### Джоба buildNpush-job

Параметризованная сборка
- Элемент типа **String** "tag_name" - Тэг, с которым образ запушится в registry после сборки
- Элемент типа **Hidden Parameter** "docker_registry"

<docker build -t myapp:$tag_name .
docker tag myapp:$tag_name $docker_registry/myapp:$tag_name
docker push $docker_registry/myapp:$tag_name>

### Джоба pullNstart-job
   
Параметризованная сборка
- Элемент типа **String** "tag_name" - Тэг, с которым образ стянется с registry и на его основе запустится контейнер
- Элемент типа **Hidden Parameter** "docker_registry"

<docker pull $docker_registry/myapp:$tag_name
docker run --name myapp-$tag_name -d -p 8080:80 $docker_registry/myapp:$tag_name>