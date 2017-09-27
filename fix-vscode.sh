sudo cp /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0 /usr/share/code/libxcb.so.1
sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1


# wget -O - https://raw.githubusercontent.com/suroegin/bash/master/fix-vscode.sh | bash

# Install extensions automatically

code --install-extension donjayamanne.python
code --install-extension wholroyd.jinja
code --install-extension freakypie.code-python-isort
code --install-extension formulahendry.code-runner
code --install-extension alexdima.copy-relative-path
code --install-extension waderyan.gitblame
code --install-extension donjayamanne.githistory
code --install-extension Zignd.html-css-class-completion
code --install-extension ionutvmi.path-autocomplete
code --install-extension alefragnani.project-manager
code --install-extension shardulm94.trailing-spaces
code --install-extension robertohuertasm.vscode-icons
code --install-extension RolandGreim.sharecode
code --install-extension kenhowardpdx.vscode-gist
code --install-extension sandy081.todotasks
code --install-extension yzane.markdown-pdf
code --install-extension goessner.mdmath
code --install-extension yzhang.markdown-all-in-one
code --install-extension AlanWalk.markdown-toc
code --install-extension mdickin.markdown-shortcuts
code --install-extension bierner.markdown-preview-github-styles
code --install-extension SolarLiner.linux-themes
code --install-extension PKief.material-icon-theme
code --install-extension lukehoban.go


# Настройки в Linux лежат здесь:
# ~/.config/Code/User/settings.json

#Внести такие данные:
#
#{
#    "workbench.iconTheme": "vscode-icons",
#
#    "terminal.integrated.shell.windows": "C:\\Windows\\system32\\cmd.exe",
#
#    "sync.gist": "",
#    "sync.lastUpload": "",
#    "sync.autoDownload": false,
#    "sync.autoUpload": false,
#    "sync.lastDownload": "",
#    "sync.version": 261,
#    "sync.showSummary": true,
#    "sync.forceDownload": false,
#    "sync.anonymousGist": false,
#    "sync.host": "",
#    "sync.pathPrefix": "",
#
#    "editor.minimap.enabled": true,
#    "editor.minimap.maxColumn": 150,
#     "editor.cursorStyle": "line",
#     "editor.renderIndentGuides": true,
#    "editor.renderLineHighlight": "all",
#
#    "files.autoSave": "afterDelay",
#    "files.exclude": {
#        "**/.git": true,
#        "**/.svn": true,
#        "**/.hg": true,
#        "**/.DS_Store": true
#    },
#    "files.autoSaveDelay": 10000,
#    "git.path": "C:\\Program Files\\Git\\cmd\\git.exe",
#    "workbench.colorTheme": "Hopscotch",
#    "editor.cursorBlinking": "phase",
#    "editor.rulers": [
#        79,
#        119
#    ],
#    "editor.overviewRulerLanes": 3,
#
#}
