git clone https://github.com/powerline/fonts.git
/fonts/install.sh

git clone https://github.com/milkbikis/powerline-shell powerline-shell
cd powerline-shell
/bin/cp config.py.dist config.py
./install.py

ln -s /root/powerline-shell/powerline-shell.py ~/powerline-shell.py

/bin/cat <<FOO >> ~/.bashrc
function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

FOO
