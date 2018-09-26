# Prepare
apt update
apt upgrade -y
apt install -y build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev python-dev python-setuptools python-pip python-smbus libc6-dev openssl libffi-dev

# Install Python 3.7.0
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar -xf Python-3.7.0.tar.xz
cd Python-3.7.0
./configure
make
make altinstall
