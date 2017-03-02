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
echo -n "Please choose GUI set:"

read setnumber
case "$setnumber" in
    1) echo "Your choice is 1. Ultra minimal GUI (xorg and openbox)"
        apt install xorg
        apt install --no-install-recommends openbox
        ;;
    2) echo "Your choice is 2. Minimal GUI with display manager (xorg, openbox and lightdm)"
        apt install xorg
        apt install --no-install-recommends lightdm-gtk-greeter
        apt install --no-install-recommends lightdm
        apt install --no-install-recommends openbox
        ;;
    3) echo "Your choice is 3. A more functional minimal desktop environment"
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
    4) echo "Your choice is 4. A full lightweight desktop environment"
        echo ""
        echo "1. "
        echo "2. "
        echo "3. "
        echo ""
        echo -n "Please choose desktop environment"
        read variant
        case "$variant" in
            1) echo ""
                ..
                ;;
            2) echo ""
                ..
                ;;
            3) echo ""
                ..
                ;;
        
        ;;
    5) echo "Your choice is 5. A full lightweight desktop environment without minding the recommendations"
        echo ""
        echo "1. "
        echo "2. "
        echo "3. "
        echo ""
        echo -n "Please choose desktop environment"
        read variant
        case "$variant" in
            1) echo ""
                ..
                ;;
            2) echo ""
                ..
                ;;
            3) echo ""
                ..
                ;;

    
        ;;
    6) echo "Your choice is 6. A full desktop with all the extras"
        echo ""
        echo "1. "
        echo "2. "
        echo "3. "
        echo "4. "
        echo "5. "
        echo "6. "
        echo ""
        echo -n "Please choose desktop environment"
        read variant
        case "$variant" in
            1) echo ""
                ..
                ;;
            2) echo ""
                ..
                ;;
            3) echo ""
                ..
                ;;
            4) echo ""
                ..
                ;;
            5) echo ""
                ..
                ;;
            6) echo ""
                ..
                ;;
    
        ;;
    x|X) echo "Cancelled..."
        exit 0
        ;;
    *) echo "Nothing typed, cancelled..."
        exit 0
        ;;
esac
