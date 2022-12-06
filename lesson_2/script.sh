#!/bin/sh

# Генерация непустых файлов в кодировке base64
for i in $(seq 1 5)
do 
    base64 /dev/urandom | head -c 100000 > file$i.txt
done

# Передача непустых сгенерированных файлов на удаленный сервер 
rsync -avz --progress ~/Projects/repos/devops-course/lesson_2/files/ root@195.2.81.60:~/projects/lesson_2/files

# Успешность выполнения скрипта
echo "===\nDone!!!\n==="