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
        sudo apt install -y libfontconfig1 libfontconfig1-dev libfreetype6 libfreetype6-dev
        export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
        wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
        tar xvjf $PHANTOM_JS.tar.bz2
        sudo mv $PHANTOM_JS /usr/local/share
        sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
        sudo pip3 install selenium
        ;;
    n|N) echo "You typed N, bye bye"
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
        sudo echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" >> /etc/apt/sources.list.d/yandex.list
        sudo apt update
        sudo apt install yandex-disk
        sudo yandex-disk setup
        ;;
    n|N) echo "You typed N, bye bye"
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac