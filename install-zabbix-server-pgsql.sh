wget https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
dpkg -i zabbix-release_4.2-1+bionic_all.deb
apt update && apt install -y zabbix-server-pgsql zabbix-frontend-php
