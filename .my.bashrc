#!/bin/bash -eu

clear

if [ $BASHRC_ENV == "jack-ThinkPad-T15-Gen-1" ]; then
    EDITOR='code'
    export COLOR_0="0;34m"
    export COLOR_1="0;32m"
    export COLOR_2="0;0m"
fi

if [ $BASHRC_ENV == "ros2_lxc" ]; then
    EDITOR='code'
    export COLOR_0="0;35m"
    export COLOR_1="0;32m"
    export COLOR_2="0;0m"
fi


source $HOME/bash_shortcuts/scripts/default.sh
source $HOME/bash_shortcuts/scripts/git.sh
source $HOME/bash_shortcuts/scripts/lxc.sh

alias edit_bash='code ~/bash_shortuts/.my.bashrc'

echo ""
