# Install upgrades, XRDP, XFCE4
apt update && \
apt upgrade -y && \
apt-get install -y xrdp && \
apt-get install -y xfce4 xfce4-terminal && \
echo "xfce4-session" > ~/.xsession && \
systemctl restart xrdp
