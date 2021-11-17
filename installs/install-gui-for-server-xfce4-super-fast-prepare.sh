# Install upgrades, XRDP, XFCE4
apt update && \
apt upgrade -y && \
apt-get install -y xrdp && \
apt-get install -y xfce4 xfce4-terminal && \
echo "xfce4-session" > ~/.xsession && \
systemctl restart xrdp


# Install Firefox
apt install firefox

# Install Google Chrome (with fix)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt --fix-broken install -y
dpkg -i google-chrome-stable_current_amd64.deb
