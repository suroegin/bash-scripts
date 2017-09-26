sudo cp /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0 /usr/share/code/libxcb.so.1
sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1


# wget -O - https://raw.githubusercontent.com/suroegin/bash/master/fix-vscode.sh | bash
