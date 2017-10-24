#!/bin/bash

if [ ! -f config.sh ]; then
    echo "The config file does not exist. Create it, please."
    exit 1
fi
source config.sh
export IP_ADDR=`hostname -I | grep -o '[0-9]\{2,\}\.[0-9]\{2,\}\.[0-9]\{2,\}\.[0-9]\{2,\}';`
export DEBIAN_FRONTEND=noninteractive

apt update && apt install -y expect

/usr/bin/expect << 'FOO'
set timeout 1
set my_username $::env(USERNAME)
set my_password $::env(PASSWORD)

spawn adduser $::env(USERNAME)
expect "(.+\n){0,}Enter new UNIX password: "
send "$my_password\r"
expect "(.+\n){0,}Retype new UNIX password: "
send "$my_password\r"
expect "(.+\n){0,}\tFull Name \[\]:"
send "Ivan\r"
expect "(.+\n){0,}\tRoom Number \[\]:"
send "495\r"
expect "(.+\n){0,}\tWork Phone \[\]:"
send "495\r"
expect "(.+\n){0,}\tHome Phone \[\]:"
send "499\r"
expect "(.+\n){0,}\tOther \[\]:"
send "no\r"
expect "(.+\n){0,}Is the information correct? \[Y/n\]"
send "\r"
expect eof
FOO

usermod -aG sudo $USERNAME
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cp config.sh /home/$USERNAME/config.sh

ssh -T $USERNAME@$IP_ADDR << 'EOF'
source config.sh
sudo apt-mark hold grub*
sudo apt upgrade -y
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt update
sudo apt install python3.6
sudo apt install -y nano build-essential software-properties-common sed dialog autoconf pkg-config tk-dev htop mc tmux mercurial git curl nginx libtool libgle3 libxml2-dev libxslt1-dev zlib1g-dev libssl-dev libcurl4-openssl-dev libncursesw5-dev libreadline-gplv2-dev libgdbm-dev libc6-dev libsqlite3-dev liblzma-dev libevent-dev python-dev python-opengl python-pip python-setuptools python-software-properties python3-dev python3-opengl python3-pip python3-setuptools python3-software-properties python3-venv xfce4 xfce4-goodies xrdp mosh

sudo ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

echo "Installing Yandex.Disk..."
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk
/bin/cat << 'FOO' > yandex-disk-setup.sh
#!/usr/bin/expect -f
set timeout 1
set sys_username $::env(USERNAME)
set my_username $::env(YD_USERNAME)
set my_password $::env(YD_PASSWORD)

spawn yandex-disk setup
expect "Would you like to use a proxy server? \[y/N\]: "
send "\r"
expect "(.+\n){0,}Enter username: "
send "$my_username\r"
expect "(.+\n){0,}Enter password: "
send "$my_password\r"
expect "(.+\n){0,}.+\/home\/$sys_username\/Yandex.Disk'\): "
send "\r"
expect "(.+\n){0,}.+launch on startup? \[Y/n\]: "
send "\r"
expect eof
FOO

chmod +x yandex-disk-setup.sh
./yandex-disk-setup.sh

echo "Installing Firefox..."
sudo apt install -y firefox

echo "Installing Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

/bin/bash ~/Yandex.Disk/apps/install_all_apps.sh

EOF
