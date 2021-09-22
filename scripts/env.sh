#!/bin/bash -eu

if [ $BASHRC_ENV == "jack-ThinkPad-T15-Gen-1" ]; then
    EDITOR='code'
    export COLOR_0="0;34m"
    export COLOR_1="0;32m"
    export COLOR_2="0;0m"

    # source /opt/ros/noetic/setup.bash
    source /opt/ros/foxy/setup.bash

elif [ $BASHRC_ENV == "ros2_lxc" ]; then
    EDITOR='code'
    export COLOR_0="0;33m"
    export COLOR_1="0;32m"
    export COLOR_2="0;0m"

elif [ $BASHRC_ENV == "appliedlogix" ]; then
    EDITOR='code'
    export COLOR_0="0;31m"
    export COLOR_1="0;30m"
    export COLOR_2="0;0m"

    source /opt/intel/openvino/bin/setupvars.sh
    source /opt/ros/melodic/setup.bash
    source ~/ws_appliedlogix/devel/setup.bash

    cd ~/ws_appliedlogix

elif [ $BASHRC_ENV == "ros2_foxy" ]; then
    EDITOR='code'
    export COLOR_0="0;33m"
    export COLOR_1="0;32m"
    export COLOR_2="0;0m"

    # source /opt/ros/noetic/setup.bash
    source /opt/ros/foxy/setup.bash

elif [ $BASHRC_ENV == "default" ]; then
    EDITOR='code'
    export COLOR_0="0;34m"
    export COLOR_1="0;30m"
    export COLOR_2="0;0m"

else
    echo "Warning: BASHRC_ENV variable defined in '~/.bashrc' not found in 'bash_shortcuts/scripts/env.sh'"
    echo "Consider setting the BASHRC_ENV variable to your desired settings."

    export EDITOR='code'
    export COLOR_0="0;34m"
    export COLOR_1="0;30m"
    export COLOR_2="0;0m"
fi

# Replaces ~/.bashrc with the user defined BASHRC_ENV and BASHRC_NAME variables and adds the sourceing 
# for the bash_shortcuts/.my.bashrc. This should be run after 
function setup_bash 
{
    local ENV_VAL=${1:-none}
    local NAME_VAL=${2:-none}
    echo "export BASHRC_ENV=$ENV_VAL && export BASHRC_NAME=$NAME_VAL && . ~/bash_shortcuts/.my.bashrc" > ~/.bashrc
    source ~/.bashrc
}
   