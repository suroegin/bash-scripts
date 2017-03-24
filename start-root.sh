#!/bin/bash

# Upgrade system
apt -y upgrade

# Install all apps which may be needed
apt -y install build-essential python3-pip software-properties-common python-software-properties sed locales-all htop mc dialog mosh tmux iptables mercurial git python3 python3-setuptools python3-software-properties curl nginx python-dev python3-dev
pip3 install virtualenv
pip3 install ipython
pip3 install lxml

# (optional) For mail
#apt -y install mailutils

# (optional) PyQt packages
#apt -y install python-pyside.qtopengl qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl

# (optional) Install dev packages
apt -y install autoconf libtool pkg-config python-opengl python3-opengl python-pyrex libgle3 python-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev libcurl4-openssl-dev libncursesw5-dev libreadline-gplv2-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev liblzma-dev libevent-dev

# Change locale to ru_RU
##  sed ‘2,$d’ /etc/default/locale > /etc/default/locale (???)
#   echo ‘LANG="ru_RU.UTF-8"’ > /etc/default/locale
#   echo ‘LANGUAGE="ru_RU.UTF-8"’ >> /etc/default/locale
#   source /etc/default/locale

# Allow ports for some apps (iptables)
iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT
ufw allow 'Nginx Full'
ufw allow 'OpenSSH'
ufw allow 'mosh'
ufw enable

# Change timezone
dpkg-reconfigure tzdata

#Edit SSH config file
nano /etc/ssh/ssh_config
service ssh restart


echo "= = = = = = = = ="
echo "CREATING NEW USER…"
echo "= = = = = = = = ="
echo "Enter the username:"
read username
adduser $username
usermod -aG sudo $username

echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "NOW REBOOTING… Bye bye! Please, login using just created username."
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
reboot
