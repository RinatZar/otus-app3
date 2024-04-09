#!/bin/bash

DIR='/etc/nginx/sites-enabled/'
DIR1='/home/otus-app1/default'
DIR3='/home/otus-app1/status.conf'
DIR2='/etc/nginx/sites-enabled/'

#Ограничение потребления java
cat > /etc




#Копируем конфиг 
cp $DIR1 $DIR2
cp $DIR3 $DIR2
echo "файл конфиги скопированы в $DIR"
systemctl restart nginx
systemctl restart prometheus-nginx-exporter
if [ $? -eq 0 ]; then
          echo "Nginx запущен, готов к работе"
else
          echo "Возникла ошибка"
fi
