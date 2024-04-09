# otus-app3. Инструкция по восстановлению
1. Установить git.
   ```bash
   sudo apt install git -y
   ```
2. Загрузить скрипты для восстановления системы.
    ```bash
   git clone https://github.com/RinatZar/otus-app3.git
   ```  
3. Запустить скрипт настройки сетевого интерфейса.
    ```bash
   bash network_static.sh
   ``` 
4. Установить elasticsearch, logstash, kibana 
   ```bash
   bash apt_install.sh
   ```
5. Запустить скрипт настройки сервисов.
   ```bash
    bash script.sh
   ```
