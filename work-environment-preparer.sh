# Part 1 - Prepare server



sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential python3-pip python3-dev python-dev python-pip software-properties-common python-software-properties sed locales-all htop mc dialog tmux mercurial git python3-setuptools python3-software-properties curl nginx autoconf libtool pkg-config python-opengl python3-opengl python-pyrex libgle3 python-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev libcurl4-openssl-dev libncursesw5-dev libreadline-gplv2-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev liblzma-dev libevent-dev
pip3 install lxml pep8 pylint flake8 ipython virtualenv 
sudo dpkg-reconfigure tzdata





# Part 2 - Install apps



echo ""
echo "= = = = = = = = = ="
echo -n "Install Yandex Disk for data exchange? (y/n) "
read item1
case "$item1" in
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



echo ""
echo "= = = = = = = = = ="
echo -n "Install OpenCV for Python? (y/n) "
read item2
case "$item2" in
    y|Y) echo "You typed "Y", okay"
		sudo apt-get install -y libgtk-3-dev
		sudo apt-get install -y build-essential
		sudo apt-get install -y libatlas-base-dev gfortran
		sudo apt-get install -y libxvidcore-dev libx264-dev
		sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
		sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
		sudo apt-get install -y python-dev python-numpy libtbb2
		pip3 install opencv-python
        ;;
    n|N) echo "You typed N, bye bye"
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac



echo ""
echo "= = = = = = = = = ="
echo "= GUI for Server  ="
echo "= = = = = = = = = ="
echo ""
echo "GUI sets:"
echo "0. XFCE4"
echo "1. Ultra minimal GUI (xorg and openbox)"
echo "2. Minimal GUI with display manager (xorg, openbox and lightdm)"
echo "3. A more functional minimal desktop environment"
echo "4. A full lightweight desktop environment"
echo "5. A full lightweight desktop environment without minding the recommendations"
echo "6. A full desktop with all the extras"
echo ""
echo "To read Tips just type tips or TIPS."
echo ""
echo -n "Please choose GUI set:"

read setnumber
case "$setnumber" in
	0) echo "Your choice is XFCE4. Okay."
		sudo apt install -y xfce4 xfce4-goodies
		;;
    1) echo "Your choice is 1. Ultra minimal GUI (xorg and openbox)"
        echo ""
        echo "Run the command startx and openbox will start (you can open a terminal there and run any application you want)"
        echo ""
        sudo apt install -y xorg
        sudo apt install -y --no-install-recommends openbox
        ;;
    2) echo "Your choice is 2. Minimal GUI with display manager (xorg, openbox and lightdm)."
        echo ""
        echo "After reboot you will see the lightdm login menu."
        echo ""
        sudo apt install -y xorg
        sudo apt install -y --no-install-recommends lightdm-gtk-greeter
        sudo apt install -y --no-install-recommends lightdm
        sudo apt install -y --no-install-recommends openbox
        ;;
    3) echo "Your choice is 3. A more functional minimal desktop environment."
        echo ""
        echo "EXPLANATION: lxde-icon-theme is needed for basic icons(there are alternatives), lxde-core and lxde-common will install the basic lxde components, policykit-1 andlxpolkit are needed to run pkexec, lxsession-logout is needed so that the logout menu works, gvfs-backends is needed if you want trash,network,devices etc support at pcmanfm"
        echo ""
        sudo apt install -y xorg
        sudo apt install -y –no-install-recommends lightdm-gtk-greeter
        sudo apt install -y –no-install-recommends lightdm
        sudo apt install -y –no-install-recommends lxde-icon-theme
        sudo apt install -y –no-install-recommends lxde-core
        sudo apt install -y –no-install-recommends lxde-common
        sudo apt install -y –no-install-recommends policykit-1 lxpolkit
        sudo apt install -y –no-install-recommends lxsession-logout
        sudo apt install -y –no-install-recommends gvfs-backends
        ;;
    4) echo "Your choice is 4. A full lightweight desktop environment (--no-install-recommends)."
        echo ""
        echo "EXPLANATION: Each of these metapackages is based on lxde,xfce and mate desktop respectively including dependencies such as alsa, lightdm etc. and with many more packages such as themes, configurations etc."
        echo ""
        echo "1. lubuntu-core (--no-install-recommends)"
        echo "2. xubuntu-core (--no-install-recommends)"
        echo "3. ubuntu-mate-core (--no-install-recommends)"
        echo ""
        echo -n "Please choose desktop environment:"
        read variant
        case "$variant" in
            1) echo ""
                sudo apt install -y xorg
                sudo apt install -y --no-install-recommends lubuntu-core
                ;;
            2) echo ""
                sudo apt install -y xorg
                sudo apt install -y --no-install-recommends xubuntu-core
                ;;
            3) echo ""
                sudo apt install -y xorg
                sudo apt install -y --no-install-recommends ubuntu-mate-core
                ;;
        esac
        ;;
    5) echo "Your choice is 5. A full lightweight desktop environment without minding the recommendations."
        echo ""
        echo "EXPLANATION: Almost the same as 4 (including full xorg installation) but with many more packages such as bluetooth, printers, scanner support, different themes and fonts, basic gnome tools etc."
        echo ""
        echo "1. lubuntu-core"
        echo "2. xubuntu-core"
        echo "3. ubuntu-mate-core"
        echo ""
        echo -n "Please choose desktop environment:"
        read variant
        case "$variant" in
            1) echo ""
                sudo apt install -y lubuntu-core
                ;;
            2) echo ""
                sudo apt install -y xubuntu-core
                ;;
            3) echo ""
                sudo apt install -y ubuntu-mate-core
                ;;
        esac
        ;;
    6) echo "Your choice is 6. A full desktop with all the extras."
        echo ""
        echo "EXPLANATION: This will install everything that the live cd of each ubuntu flavor installs (that means even the media players or whatever they find useful for their flavor. So, it's not recommended option."
        echo ""
        echo "1. lubuntu-desktop"
        echo "2. xubuntu-desktop"
        echo "3. ubuntu-mate-desktop"
        echo "4. ubuntu-gnome-desktop"
        echo "5. ubuntu-desktop"
        echo "6. kubuntu-desktop"
        echo ""
        echo -n "Please choose desktop environment:"
        read variant
        case "$variant" in
            1) echo ""
                sudo apt install -y lubuntu-desktop
                ;;
            2) echo ""
                sudo apt install -y xubuntu-desktop
                ;;
            3) echo ""
                sudo apt install -y ubuntu-mate-desktop
                ;;
            4) echo ""
                sudo apt install -y ubuntu-gnome-desktop
                ;;
            5) echo ""
                sudo apt install -y ubuntu-desktop
                ;;
            6) echo ""
                sudo apt install -y kubuntu-desktop
                ;;
        esac
        ;;
    tips|TIPS) echo ""
        echo "TIP1: The --no-install-recommended options applies to all dependencies packages recursively so I first install xorg package to make sure all graphic drivers and other packages are installed and so that my system is portable even if I change motherboard or gpu. Some people install only components of xorg but I've never been able to create a usable system this way."
        echo "TIP2: If an option you choose installs network-manager and network-manager-gnome then better use it to configure your network and delete everything at /etc/network/interfaces file (except the lo interface) in order to avoid conflicts."
        echo "TIP3: If you need remote desktop via x11vnc then choose option 2 to 6 (I think you also need to add option -auth guess and -loopso that vnc works before you login and after you logout)"
        echo "TIP4: At options 2 to 6 if you wanna stop lightdm autostarting then run the command sudo systemctl disable lightdm and you can start it whenever you want with sudo systemctl start lightdm. To re-enable it run sudo systemctl enable lightdm and check it with systemctl is-enabled lightdm (sometimes you can't re-enable it and the is-enabled commands has output static so run sudo apt install -reinstall lightdm to fix it)"
        echo "TIP5: There is also another option (which I left out on purpose). You can install the specific desktop environment metapackage like lxde, xfce4, mate-desktop-environment, plasma-desktop, unity, gnome. However, you will need more packages that just xorg in most cases and these packages or metapackages might install packages that are not longer preferred by any Ubuntu flavor. For example lxde installs wicd as recommendation when all flavors (including lubuntu) use network-manager and network-manager-gnome nowadays. To see differences between packages you can search here: http://packages.ubuntu.com/"
        ;;
    *) echo "Nothing typed, cancelled..."
        exit 0
        ;;
esac



echo ""
echo "= = = = = = = = = ="
echo -n "Install XRDP for remote control? (y/n) "
echo "= = = = = = = = = ="
read item3
case "$item3" in
    y|Y) echo "You typed "Y", okay"
		sudo apt install -y xrdp
        ;;
    n|N) echo "You typed N, bye bye"
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac



echo ""
echo "= = = = = = = = = ="
echo -n "Install VS Code for develop? (y/n) "
echo "= = = = = = = = = ="
read item4
case "$item4" in
    y|Y) echo "You typed "Y", okay"
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt update
        sudo apt install -y code
        echo "Fixing VS Code..."
        sudo cp /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0 /usr/share/code/libxcb.so.1
        sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1 
        ;;
    n|N) echo "You typed N, bye bye"
        ;;
    *) echo "Nothing typed, so we begin install this apps."
        ;;
esac




echo "Installing Firefox..."
sudo apt install -y firefox

echo "Installing Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

