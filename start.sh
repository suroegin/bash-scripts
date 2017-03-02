#!/bin/bash

echo "= = = = = = = = ="
echo "BEGIN TIME SAVER"
echo "= = = = = = = = ="

# Update and Upgrade
apt update && apt -y upgrade

# Install all apps which may be needed
apt -y install build-essential software-properties-common python-software-properties sed locales-all htop mc dialog mosh tmux iptables mercurial git python3 python3-setuptools python3-software-properties curl nginx python-dev python3-dev mailutils
easy_install3 pip
pip3 install ipython
pip3 install lxml

# Install dev packages (optional)
apt -y install autoconf libtool pkg-config python-opengl python3-opengl python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libxml2-dev libxslt1-dev zlib1g-dev python3-pip libssl-dev libcurl4-openssl-dev libncursesw5-dev libreadline-gplv2-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev liblzma-dev libevent-dev

# Change locale to ru_RU
# sed ‘2,$d’ /etc/default/locale > /etc/default/locale (???)
echo ‘LANG="ru_RU.UTF-8"’ > /etc/default/locale
echo ‘LANGUAGE="ru_RU.UTF-8"’ >> /etc/default/locale
source /etc/default/locale

# Allow ports for some apps (iptables)
iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT

# Change timezone
dpkg-reconfigure tzdata

#Edit SSH config file
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

echo "= = = = = = = = = ="
### Yandex Disk
# https://yandex.ru/support/disk/cli-clients.html
echo "= = = = = = = = = ="
echo -n "Install Yandex Disk? (y/n) "
read item
case "$item" in
    y|Y) echo "You typed "Y", okay"
        wget -O YANDEX-DISK-KEY.GPG http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG
        sudo apt-key add YANDEX-DISK-KEY.GPG
        echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" >> /etc/apt/sources.list.d/yandex.list
        apt update
        apt install yandex-disk
        yandex-disk setup
        ;;
    n|N) echo "You typed N, bye bye"
        exit 0
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac


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

echo "= = = = = = = = ="
echo ""
echo "= = = = = = = = ="


