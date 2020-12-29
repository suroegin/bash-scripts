#!/bin/bash

mc_install_xoria() {
# Install mc
sudo apt install mc

# Install depedencies
sudo apt install autopoint libslang2-dev

# Make a directory for storing skins
sudo mkdir -p ~/.local/share/mc/skins/

#
sudo /bin/cat <<FOO >> ~/.profile
export TERM=xterm-256color
FOO

# Make a Xoria256 skin file
sudo bash -c "/bin/cat << EOF > ~/.local/share/mc/skins/xoria256.ini
[skin]
    description = Xoria256
    256colors = true

# [Lines]
#     horiz = ─
#     vert = │
#     lefttop = ┌
#     righttop = ┐
#     leftbottom = └
#     rightbottom = ┘
#     topmiddle = ┬
#     bottommiddle = ┴
#     leftmiddle = ├
#     rightmiddle = ┤
#     cross = ┼
#     dhoriz = ─
#     dvert = │
#     dlefttop = ┌
#     drighttop = ┐
#     dleftbottom = └
#     drightbottom = ┘
#     dtopmiddle = ┬
#     dbottommiddle = ┴
#     dleftmiddle = ├
#     drightmiddle = ┤

[Lines]
    horiz = ─
    vert = │
    lefttop = ┌
    righttop = ┐
    leftbottom = └
    rightbottom = ┘
    topmiddle = ┬
    bottommiddle = ┴
    leftmiddle = ├
    rightmiddle = ┤
    cross = ┼
    dhoriz = ═
    dvert = ║
    dlefttop = ╔
    drighttop = ╗
    dleftbottom = ╚
    drightbottom = ╝
    dtopmiddle = ╤
    dbottommiddle = ╧
    dleftmiddle = ╟
    drightmiddle = ╢

[core]
    _default_ = color250;color234
    selected = ;color60
    marked = color228
    markselect = color228;color60
    reverse = color234;color250;
    header = color180;;bold

    gauge = white;black

    input = color252;color60;bold
    inputunchanged = color250;color60;bold
    inputmark = color228;color236;bold

    disabled = color244;color250

    #inputhistory =
    #commandhistory =
    #commandlinemark = black;lightgray

[dialog]
    _default_ = black;color250
    dhotnormal = color88;;
    dfocus = black;color73;
    dhotfocus = color88;color73;
    dtitle = color235;;bold

[error]
    _default_ = white;red
    errdfocus = black;lightgray
    errdhotnormal = yellow;red
    errdhotfocus = yellow;lightgray
    errdtitle = yellow;red;bold

[filehighlight]
    directory = ;;bold
    executable = color114
    symlink = color180
    hardlink =
    stalelink = rgb404
    device = rgb231
    special = rgb331
    core = rgb430
    temp = color239
    archive = color174
    doc = rgb033
    source = color29
    media = color110
    graph = color182
    database = color31

[menu]
    _default_ = black;color250
    menusel = black;color73;
    menuhot = color88;;
    menuhotsel = color88;color73;
    menuinactive = color244

[popupmenu]
    _default_ = black;color250
    menusel = black;color73
    menutitle = ;;bold

[buttonbar]
    button = black;color250
    hotkey = color88;color181;bold

[statusbar]
    _default_ = black;color250

[help]
    _default_ = black;color250
    helpitalic = color88;;bold
    helpbold = color235;;bold
    helplink = color19;;
    helpslink = black;color73;inverse
    helptitle = color235;;bold

[editor]
    _default_ = color250;color234
    editbold = ;;bold
    editmarked = ;color60
    editwhitespace = color236;color234
    editlinestate = ;color235
    bookmark = ;color239;
    bookmarkfound = ;color239;bold
    editrightmargin = color180;color235;bold
#    editbg =
    editframe = color244;
    editframeactive = color250;
    editframedrag = color73;

[viewer]
    _default_ = color250;color234
    viewbold = ;;bold
    viewunderline = ;;underline
    viewselected = color228;color60

[diffviewer]
    changedline = ;color60
    changednew = black;color174
    added = black;color181
    changed = black;color151
    removed = ;color235
    error = rgb554;rgb320

[widget-common]
    sort-sign-up = ↑
    sort-sign-down = ↓

[widget-panel]
    hiddenfiles-sign-show = •
    hiddenfiles-sign-hide = ○
    history-prev-item-sign = «
    history-next-item-sign = »
    history-show-list-sign = ^
    filename-scroll-left-char = «
    filename-scroll-right-char = »

[widget-scollbar]
    first-vert-char = ↑
    last-vert-char = ↓
    first-horiz-char = «
    last-horiz-char = »
    current-char = ■
    background-char = ▒

[widget-editor]
    window-state-char = ↕
    window-close-char = ✕
FOO"
}