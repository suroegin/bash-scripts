wget https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
dpkg -i zabbix-release_4.2-1+bionic_all.deb
apt update && apt install -y zabbix-server-pgsql zabbix-frontend-php

# Create user for database
sudo -u postgres createuser --pwprompt zabbix

# Create database
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix

# Import Zabbix tables to database
zcat /usr/share/doc/zabbix-server-pgsql/create.sql.gz | psql -U zabbix zabbix

# Add password into Zabbix config
echo "DBPassword=$ZABBIX_DB_PASSWORD" >> /etc/zabbix/zabbix_server.conf

# Set timezone in apache2's php.ini config file
echo "date.timezone = \"Europe/Moscow\"" >> /etc/php/7.2/apache2/php.ini

# Launch Zabbix and add to autolaunch
service zabbix-server start
update-rc.d zabbix-server enable

# Restart apache2
service apache2 restart
