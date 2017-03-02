echo "= = = = = = = = = ="
echo "Installing GUI for Server."
echo "= = = = = = = = = ="
echo ""
echo "GUI sets:"
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
    1) echo "Your choice is 1. Ultra minimal GUI (xorg and openbox)"
        echo ""
        echo "Run the command startx and openbox will start (you can open a terminal there and run any application you want)"
        echo ""
        apt install xorg
        apt install --no-install-recommends openbox
        ;;
    2) echo "Your choice is 2. Minimal GUI with display manager (xorg, openbox and lightdm)."
        echo ""
        echo "After reboot you will see the lightdm login menu."
        echo ""
        apt install xorg
        apt install --no-install-recommends lightdm-gtk-greeter
        apt install --no-install-recommends lightdm
        apt install --no-install-recommends openbox
        ;;
    3) echo "Your choice is 3. A more functional minimal desktop environment."
        echo ""
        echo "EXPLANATION: lxde-icon-theme is needed for basic icons(there are alternatives), lxde-core and lxde-common will install the basic lxde components, policykit-1 andlxpolkit are needed to run pkexec, lxsession-logout is needed so that the logout menu works, gvfs-backends is needed if you want trash,network,devices etc support at pcmanfm"
        echo ""
        apt install xorg
        apt install –no-install-recommends lightdm-gtk-greeter
        apt install –no-install-recommends lightdm
        apt install –no-install-recommends lxde-icon-theme
        apt install –no-install-recommends lxde-core
        apt install –no-install-recommends lxde-common
        apt install –no-install-recommends policykit-1 lxpolkit
        apt install –no-install-recommends lxsession-logout
        apt install –no-install-recommends gvfs-backends
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
                apt install xorg
                apt install --no-install-recommends lubuntu-core
                ;;
            2) echo ""
                apt install xorg
                apt install --no-install-recommends xubuntu-core
                ;;
            3) echo ""
                apt install xorg
                apt install --no-install-recommends ubuntu-mate-core
                ;;
        
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
                apt install lubuntu-core
                ;;
            2) echo ""
                apt install xubuntu-core
                ;;
            3) echo ""
                apt install ubuntu-mate-core
                ;;

    
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
                apt install lubuntu-desktop
                ;;
            2) echo ""
                apt install xubuntu-desktop
                ;;
            3) echo ""
                apt install ubuntu-mate-desktop
                ;;
            4) echo ""
                apt install ubuntu-gnome-desktop
                ;;
            5) echo ""
                apt install ubuntu-desktop
                ;;
            6) echo ""
                apt install kubuntu-desktop
                ;;
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
