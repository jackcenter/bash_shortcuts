#!/bin/bash -eu


# TODO: make warning a environment variable and add actual color names.
if [ $BASHRC_DEVICE == "ThinkPad-T15-Gen-1" ]; then
    EDITOR='code'

elif [ $BASHRC_DEVICE == "NUC10i5FNK" ]; then
    EDITOR='code'

elif [ $BASHRC_DEVICE == "rpi" ]; then
    EDITOR='vim'

elif [ $BASHRC_DEVICE == "default" ]; then
    EDITOR='code'

else
    echo "\e[33mWarning: BASHRC_DEVICE variable defined in '~/.bashrc' not found in 'bash_shortcuts/scripts/env.sh'"
    echo "\e[33mConsider setting the BASHRC_ENV variable to your desired settings."
    echo ""

    export EDITOR='code'
fi

if [ $BASHRC_ENV == "ros-melodic" ]; then
    export COLOR_0="0;35m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/melodic/setup.bash

elif [ $BASHRC_ENV == "ros-noetic" ]; then
    export COLOR_0="0;32m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/noetic/setup.bash

elif [ $BASHRC_ENV == "ros2-foxy" ]; then
    export COLOR_0="38;5;202m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/foxy/setup.bash

elif [ $BASHRC_ENV == "ros2-galactic" ]; then
    export COLOR_0="0;34m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/ros/galactic/setup.bash

elif [ $BASHRC_ENV == "appliedlogix" ]; then
    export COLOR_0="0;31m"
    export COLOR_1="0;90m"
    export COLOR_2="0;0m"

    source /opt/intel/openvino/bin/setupvars.sh
    source /opt/ros/melodic/setup.bash
    source ~/ws_appliedlogix/devel/setup.bash

    cd ~/ws_appliedlogix

elif [ $BASHRC_ENV == "website-picknik" ]; then
    export COLOR_0="38;5;42m"
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
