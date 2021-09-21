#!/bin/bash -eu

clear

source $HOME/bash_shortcuts/scripts/default.sh
source $HOME/bash_shortcuts/scripts/env.sh
source $HOME/bash_shortcuts/scripts/git.sh
source $HOME/bash_shortcuts/scripts/lxc.sh

# TODO: this should only be run in ROS environments
source $HOME/bash_shortcuts/scripts/ros.sh

alias edit_bash='code ~/bash_shortuts/.my.bashrc'

echo ""
