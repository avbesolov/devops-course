# Проделанные шаги

1. apt update && apt upgrade -y
2. sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
3. sudo chmod +x /usr/local/bin/docker-compose
4. sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
5. vim docker-compose.yml

```yml
nexus:
    image: sonatype/nexus3
    ports:
        - "8081:8081"
        - "8123:8123"
    volumes:
        - ./data:/nexus-data
```

6. docker-compose build
7. chmod 777 data - полные права на volume nexus'a (совсем не секьюрно)
8. Первоначальная настройка nexus'a
9. Создание и настройка докер-репозитория (порт 8123)
10. Создать файл vim /etc/docker/daemon.json - чтобы нексус не ругался на сертификаты и протоколы при пуше в созданный докер-репозиторий (совсем не секьюрно)

```json
{

    "insecure-registries" : ["195.2.81.37:8123"]

}
```
11. docker login 195.2.81.37:8123