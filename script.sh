#!/bin/bash

DIR='/etc/elasticsearch/'
DIR1='/home/otus-app3/elasticsearch.yml'
#DIR3='/home/otus-app1/status.conf'
#DIR2='/etc/nginx/sites-enabled/'

#Ограничение потребления java
echo -e "-Xms3g\n-Xmx3g"> /etc/elasticsearch/jvm.options.d/jvm.options
echo "Настроено ограничение для Java в потребление ресурсов, 3 gb"

#Скопировать файл конфигурации elasticsearch
cp $DIR1 $DIR
systemctl daemon-reload
systemctl restart elasticsearch
if [ $? -eq 0 ]; then
          echo "elasticsearch запущен, готов к работе"
else
          echo "Возникла ошибка, elasticsearch"
fi

# Настройка kibana
if [ -f "/etc/kibana/kibana.yml" ]; then
  sed -i "s/^#server.port\s*:\s* 5601/server.port: 5601/" "/etc/kibana/kibana.yml"
  sed -i "s/^#server.host\s*:\s* "localhost"/server.host: "0.0.0.0"/" "/etc/kibana/kibana.yml"
else
  echo "файл /etc/kibana/kibana.yml не найден"
fi
systemctl daemon-reload
systemctl restart kibana
if [ $? -eq 0 ]; then
          echo "kibana запущен, готов к работе"
else
          echo "Возникла ошибка, kibana"
fi

# Настройка logstash

file="/etc/logstash/logstash.yml"
search_string="# path.config:"
replace_string="path.config: /etc/logstash/conf.d"

if grep -q "$search_string" "$file"; then
    awk -v search="$search_string" -v replace="$replace_string" '{gsub(search, replace)} 1' "$file" > temp_file && mv temp_file "$file"
    echo "Строка '$search_string' успешно заменена на '$replace_string' в файле $file"
else
    echo "Строка '$search_string' не найдена в файле $file"
fi
cp /home/otus-app3/logstash-nginx-es.conf /etc/logstash/conf.d/
systemctl daemon-reload
systemctl restart logstash
if [ $? -eq 0 ]; then
          echo "logstash запущен, готов к работе"
else
          echo "Возникла ошибка, logstash"
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
