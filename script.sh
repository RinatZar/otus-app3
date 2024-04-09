#!/bin/bash  elasticsearch.yml

DIR='/etc/elasticsearch/'
DIR1='/home/otus-app3/elasticsearch.yml'
#DIR3='/home/otus-app1/status.conf'
#DIR2='/etc/nginx/sites-enabled/'

#Ограничение потребления java
echo -e "-Xms1g\n-Xmx1g"> /etc/elasticsearch/jvm.options.d/jvm.options
echo "Java ограничен в потребление ресурсов, 1 gb"

#Скопировать файл конфигурации 
cp $DIR1 $DIR
systemctl daemon-reload
systemctl restart elasticsearch
if [ $? -eq 0 ]; then
          echo "elasticsearch запущен, готов к работе"
else
          echo "Возникла ошибка, elasticsearch"
fi





#Копируем конфиг 
#cp $DIR1 $DIR2
#cp $DIR3 $DIR2
#echo "файл конфиги скопированы в $DIR"
#systemctl restart nginx
#systemctl restart prometheus-nginx-exporter
#if [ $? -eq 0 ]; then
#          echo "Nginx запущен, готов к работе"
#else
#          echo "Возникла ошибка"
#fi
