# Проделанные шаги

1. apt update && apt upgrade -y
2. apt install docker.io -y
3. vim Dockerfile

```Dockerfile
FROM nginx:1.23.3-alpine
COPY ./html-dir /usr/share/nginx/html
```

5. mkdir html-dir
6. vim html-dir/index.html

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Example</title>
    </head>
    <body>
        <p>This is an example of a simple HTML page with one paragraph.</p>
    </body>
</html>
```

7. Создание файла vim /etc/docker/daemon.json - чтобы нексус не ругался на сертификаты и протоколы при пуше в созданный докер-репозиторий (совсем не секьюрно)

```json
{

    "insecure-registries" : ["195.2.81.37:8123"]

}
```
8. systemctl restart docker
9. docker login http://195.2.81.37:8123