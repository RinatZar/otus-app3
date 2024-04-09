#!/bin/bash

# Настройка logstash
if [ -f "/etc/logstash/logstash.yml" ]; then
  sed -i "s/^# path.config:\s*/path.config: /etc/logstash/conf.d/" "/etc/logstash/logstash.yml"
#  sed -i "s/^bind-address\s*=\s*127.0.0.1/$bind_address_new/" $cre_mysqld_cnf
  else
  echo "файл /etc/logstash/logstash.yml не найден"
fi
systemctl daemon-reload
systemctl restart logstash
if [ $? -eq 0 ]; then
          echo "logstash запущен, готов к работе"
else
          echo "Возникла ошибка, logstash"
fi
