#!/bin/bash

echo "= = = = = = = = ="
echo "BEGIN TIME SAVER"
echo "= = = = = = = = ="

# Update and Upgrade
apt update && apt -y upgrade

# Install all apps which may be needed
apt -y install build-essential sed locales-all htop mc dialog mosh iptables mercurial git python3 python3-setuptools python3-software-properties curl nginx 

# Install dev packages (optional)
libncursesw5-dev libreadline-gplv2-dev libssl-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev liblzma-dev

sed ‘2,$d’ /etc/default/locale > /etc/default/locale
echo ‘LANG="ru_RU.UTF-8"’ > /etc/default/locale
echo ‘LANGUAGE="ru_RU.UTF-8"’ > /etc/default/locale

dpkg-reconfigure tzdata
iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT
vi /etc/ssh/ssh_config
service ssh restart


echo "= = = = = = = = = ="
### SELENIUM + PhantomJS
echo "= = = = = = = = = ="
echo -n "Install Selenium and PhantomJS (driver for Selenium)? (y/n) "
read item
case "$item" in
    y|Y) echo "You typed "Y", okay"
        
        echo "= = = = = = = = = ="
        echo "INSTALLING PhantomJS, SELENIUM"
        echo "= = = = = = = = = ="
        apt install -y libfontconfig1 libfontconfig1-dev build-essential libfreetype6 libfreetype6-dev
        export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
        wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
        tar xvjf $PHANTOM_JS.tar.bz2
        mv $PHANTOM_JS /usr/local/share
        ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
        pip3 install selenium
        ;;
    n|N) echo "You typed N, bye bye"
        exit 0
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac

echo "= = = = = = = = ="
echo ""
echo "= = = = = = = = ="


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


