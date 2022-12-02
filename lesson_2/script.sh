#!/bin/sh

# Генерация непустых файлов в кодировке base64
for i in $(seq 1 5)
do 
    base64 /dev/urandom | head -c 100000 > file$i.txt
done
echo "\n===\nDone!!!\n==="

# Вывод содержимого папки
echo "\nСодержимое папки lesson_2\n"
ls -lah .
echo