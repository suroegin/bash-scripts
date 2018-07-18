# prepare steps
apt update
apt install -y wget

# prepare folder
mkdir Reddcoin && cd Reddcoin

# download Reddcoin wallet and extract it
wget https://github.com/reddcoin-project/reddcoin/releases/download/v2.0.1.2/reddcoin-2.0.1.2-linux.tar.gz -O - | tar -zxf -

# rename folder to wallet
mv redd*/ wallet/

# do first launch
./wallet/bin/64/reddcoind

# create reddcoin.conf and fill
/bin/cat << "FOO" > ~/.reddcoin/reddcoin.conf
server=1
rpcuser=dockerreddcoinuser
rpcpassword=aslkSDKJ12092398
FOO

# launch reddcoind
./wallet/bin/64/reddcoind
