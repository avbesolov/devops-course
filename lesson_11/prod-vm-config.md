1. apt update && apt upgrade -y
2. apt install tomcat9 tomcat9-admin -y
3. В содержимое файла с ролями и пользователями tomcat были дописаны строки - vim /etc/tomcat9/tomcat-users.xml

```xml
<role rolename="manager-gui" />
<role rolename="manager-script" />
<user username="deployer" password="deployer" roles="manager-gui,manager-script" />
```

4. Для применения изменений сервис был перезапущен - systemctl restart tomcat9