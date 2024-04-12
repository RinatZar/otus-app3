#!/bin/bash

# Установка elasticsearch, logstash, kibana
sudo apt update
dpkg -i /home/otus/elasticsearch-8.9.1-amd64.deb
dpkg -i /home/otus/logstash-8.9.1-amd64.deb
dpkg -i /home/otus/kibana-8.9.1-amd64.deb
systemctl daemon-reload
systemctl restart elasticsearch
if [ $? -eq 0 ]; then
          echo "elasticsearch запущен, готов к работе"
else
          echo "Возникла ошибка, elasticsearch"
fi
systemctl restart logstash
if [ $? -eq 0 ]; then
          echo "logstash запущен, готов к работе"
else
          echo "Возникла ошибка, logstash"
fi
systemctl restart kibana
if [ $? -eq 0 ]; then
          echo "kibana запущен, готов к работе"
else
          echo "Возникла ошибка, kibana"
fi
#echo "пакеты elasticsearch, logstash, kibana установлены"






