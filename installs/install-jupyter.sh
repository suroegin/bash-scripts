apt install python3 python3-pip
pip3 install virtualenv

cd ~
mkdir jupyter
mkdir .virtualenvs

virtualenv ~/.virtualenvs/jupyter
source ~/.virtualenvs/jupyter/bin/activate

pip install ipython
pip install jupyter

jupyter notebook --generate-config --allow-root


/bin/cat <<FOO > ~/.jupyter/jupyter_notebook_config.py
c.NotebookApp.ip = '*'
c.NotebookApp.password = 'sha1:13a2e1b876ec:f44d1c967eb3651ad93036e88bb1a7b2e60054cb'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 5235
c.NotebookApp.allow_root = True
FOO

echo ""
echo "Ready! Just type: jupyter notebook and open link in the browser"
echo ""
