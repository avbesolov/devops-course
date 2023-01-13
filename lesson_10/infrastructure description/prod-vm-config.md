# Проделанные шаги

1. apt update && apt upgrade -y
2. apt install docker.io -y

3. Скопировал файл с dev-вм vim /etc/docker/daemon.json - чтобы нексус не ругался на сертификаты и протоколы при пуше в созданный докер-репозиторий (совсем не секьюрно)

```bash
scp /etc/docker/daemon.json root@178.20.43.152:/etc/docker/
```

4. systemctl restart docker
5. docker login http://195.2.81.37:8123
6. apt install curl -y
7. curl -v 94.103.89.223:8080 - проверка работоспособности сайта