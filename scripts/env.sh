#!/bin/bash -eu


# TODO: make warning a environment variable and add actual color names.
if [ $BASHRC_DEVICE == "ThinkPad" ]; then
    EDITOR='code'

elif [ $BASHRC_DEVICE == "NUC10i5FNK" ]; then
    EDITOR='code'

    alias ssh_rpi='ssh ubuntu@10.0.0.88'

elif [ $BASHRC_DEVICE == "rpi" ]; then
    EDITOR='vim'

elif [ $BASHRC_DEVICE == "or-lin-mpc2" ]; then
    EDITOR='code'
    
elif [ $BASHRC_DEVICE == "default" ]; then
    EDITOR='code'

else
    echo -e "\033[0;33mWarning: BASHRC_DEVICE variable defined in '~/.bashrc' not found in 'bash_shortcuts/scripts/env.sh'\033[0m"
    echo -e "\033[0;33mConsider setting the BASHRC_ENV variable to your desired settings.\033[0m"
    echo ""

    export EDITOR='code'
fi

if [ $BASHRC_ENV == "ros-melodic" ]; then
    export COLOR_0="0;35m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/melodic/setup.bash
    source $HOME/bash_shortcuts/scripts/ros.sh

elif [ $BASHRC_ENV == "ros-noetic" ]; then
    export COLOR_0="0;32m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/noetic/setup.bash
    source $HOME/bash_shortcuts/scripts/ros.sh

elif [ $BASHRC_ENV == "ros2-foxy" ]; then
    export COLOR_0="38;5;202m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/foxy/setup.bash
    source $HOME/bash_shortcuts/scripts/ros.sh

elif [ $BASHRC_ENV == "ros2-galactic" ]; then
    export COLOR_0="0;34m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/galactic/setup.bash
    source $HOME/bash_shortcuts/scripts/ros.sh

elif [ $BASHRC_ENV == "ros2-rolling" ]; then
    export COLOR_0="38;5;78m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    export ROSDISTRO_INDEX_URL=https://raw.githubusercontent.com/ros/rosdistro/rolling/2022-01-28/index-v4.yaml
    source /opt/ros/rolling/setup.bash

elif [ $BASHRC_ENV == "outrider" ]; then
    export COLOR_0="0;33m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

elif [ $BASHRC_ENV == "default" ]; then
    export COLOR_0="0;34m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

else
    echo "Warning: BASHRC_ENV variable defined in '~/.bashrc' not found in 'bash_shortcuts/scripts/env.sh'"
    echo "Consider setting the BASHRC_ENV variable to your desired settings."

    export EDITOR='code'
    export COLOR_0="0;34m"
    export COLOR_1="0;30m"
    export COLOR_2="0;0m"
fi
