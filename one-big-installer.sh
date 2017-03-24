# FOR ROOTS

funcs_for_root__starter() {
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
echo ""

echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "NOW REBOOTING… Bye bye! Please, login using just created username."
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
reboot
}

# ///////////////////////////
# FOR USERS

funcs_for_user__() {

}

funcs_for_user__install_selenium_phantomjs() {
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
        export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
        wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
        tar xvjf $PHANTOM_JS.tar.bz2
        sudo mv $PHANTOM_JS /usr/local/share
        sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
        sudo pip3 install selenium --user
        ;;
    n|N) echo "You typed N, bye bye"
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac
echo ""
}

funcs_for_user__install_yandex-disk() {
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
        sudo /bin/cat <<FOO > /etc/apt/sources.list.d/yandex.list
        deb http://repo.yandex.ru/yandex-disk/deb/ stable main
FOO

        sudo apt update
        sudo apt install yandex-disk
        sudo yandex-disk setup
        ;;
    n|N) echo "You typed N, bye bye"
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac
}

funcs_for_user__install_mc_skin_xoria256() {
# Install mc
sudo apt install mc

# Install depedencies
sudo apt install autopoint libslang2-dev

# Make a directory for storing skins
sudo mkdir -p ~/.local/share/mc/skins/

#
sudo /bin/cat <<FOO >> ~/.profile
export TERM=xterm-256color
FOO

# Make a Xoria256 skin file
sudo bash -c "/bin/cat << EOF > ~/.local/share/mc/skins/xoria256.ini
[skin]
    description = Xoria256
    256colors = true

# [Lines]
#     horiz = ─
#     vert = │
#     lefttop = ┌
#     righttop = ┐
#     leftbottom = └
#     rightbottom = ┘
#     topmiddle = ┬
#     bottommiddle = ┴
#     leftmiddle = ├
#     rightmiddle = ┤
#     cross = ┼
#     dhoriz = ─
#     dvert = │
#     dlefttop = ┌
#     drighttop = ┐
#     dleftbottom = └
#     drightbottom = ┘
#     dtopmiddle = ┬
#     dbottommiddle = ┴
#     dleftmiddle = ├
#     drightmiddle = ┤

[Lines]
    horiz = ─
    vert = │
    lefttop = ┌
    righttop = ┐
    leftbottom = └
    rightbottom = ┘
    topmiddle = ┬
    bottommiddle = ┴
    leftmiddle = ├
    rightmiddle = ┤
    cross = ┼
    dhoriz = ═
    dvert = ║
    dlefttop = ╔
    drighttop = ╗
    dleftbottom = ╚
    drightbottom = ╝
    dtopmiddle = ╤
    dbottommiddle = ╧
    dleftmiddle = ╟
    drightmiddle = ╢

[core]
    _default_ = color250;color234
    selected = ;color60
    marked = color228
    markselect = color228;color60
    reverse = color234;color250;
    header = color180;;bold

    gauge = white;black

    input = color252;color60;bold
    inputunchanged = color250;color60;bold
    inputmark = color228;color236;bold

    disabled = color244;color250

    #inputhistory =
    #commandhistory =
    #commandlinemark = black;lightgray

[dialog]
    _default_ = black;color250
    dhotnormal = color88;;
    dfocus = black;color73;
    dhotfocus = color88;color73;
    dtitle = color235;;bold

[error]
    _default_ = white;red
    errdfocus = black;lightgray
    errdhotnormal = yellow;red
    errdhotfocus = yellow;lightgray
    errdtitle = yellow;red;bold

[filehighlight]
    directory = ;;bold
    executable = color114
    symlink = color180
    hardlink =
    stalelink = rgb404
    device = rgb231
    special = rgb331
    core = rgb430
    temp = color239
    archive = color174
    doc = rgb033
    source = color29
    media = color110
    graph = color182
    database = color31

[menu]
    _default_ = black;color250
    menusel = black;color73;
    menuhot = color88;;
    menuhotsel = color88;color73;
    menuinactive = color244

[popupmenu]
    _default_ = black;color250
    menusel = black;color73
    menutitle = ;;bold

[buttonbar]
    button = black;color250
    hotkey = color88;color181;bold

[statusbar]
    _default_ = black;color250

[help]
    _default_ = black;color250
    helpitalic = color88;;bold
    helpbold = color235;;bold
    helplink = color19;;
    helpslink = black;color73;inverse
    helptitle = color235;;bold

[editor]
    _default_ = color250;color234
    editbold = ;;bold
    editmarked = ;color60
    editwhitespace = color236;color234
    editlinestate = ;color235
    bookmark = ;color239;
    bookmarkfound = ;color239;bold
    editrightmargin = color180;color235;bold
#    editbg =
    editframe = color244;
    editframeactive = color250;
    editframedrag = color73;

[viewer]
    _default_ = color250;color234
    viewbold = ;;bold
    viewunderline = ;;underline
    viewselected = color228;color60

[diffviewer]
    changedline = ;color60
    changednew = black;color174
    added = black;color181
    changed = black;color151
    removed = ;color235
    error = rgb554;rgb320

[widget-common]
    sort-sign-up = ↑
    sort-sign-down = ↓

[widget-panel]
    hiddenfiles-sign-show = •
    hiddenfiles-sign-hide = ○
    history-prev-item-sign = «
    history-next-item-sign = »
    history-show-list-sign = ^
    filename-scroll-left-char = «
    filename-scroll-right-char = »

[widget-scollbar]
    first-vert-char = ↑
    last-vert-char = ↓
    first-horiz-char = «
    last-horiz-char = »
    current-char = ■
    background-char = ▒

[widget-editor]
    window-state-char = ↕
    window-close-char = ✕
FOO"
}