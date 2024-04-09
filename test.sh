#!/bin/bash

file="/etc/logstash/logstash.yml"
search_string="# path.config:"
replace_string="path.config: /etc/logstash/conf.d"

if grep -q "$search_string" "$file"; then
    awk -v search="$search_string" -v replace="$replace_string" '{gsub(search, replace)} 1' "$file" > temp_file && mv temp_file "$file"
    echo "Строка '$search_string' успешно заменена на '$replace_string' в файле $file"
else
    echo "Строка '$search_string' не найдена в файле $file"
fi




systemctl daemon-reload
systemctl restart logstash
if [ $? -eq 0 ]; then
          echo "logstash запущен, готов к работе"
else
          echo "Возникла ошибка, logstash"
fi
