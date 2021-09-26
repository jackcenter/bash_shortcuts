#!/bin/bash

# Replaces ~/.bashrc with the user defined BASHRC_ENV and BASHRC_NAME variables and adds the sourceing 
# for the bash_shortcuts/.my.bashrc.
function setup_bash 
{
    local DEVICE_VAL=${1:-none}
    local ENV_VAL=${2:-none}
    local NAME_VAL=${3:-none}
    echo "export BASHRC_DEVICE=$DEVICE_VAL && export BASHRC_ENV=$ENV_VAL && export BASHRC_NAME=$NAME_VAL" > ~/.bashrc
    echo ". ~/bash_shortcuts/.my.bashrc" >> ~/.bashrc 
    source ~/.bashrc
}

# Installs ros melodic.
# 
function install_melodic
{
    # TODO: check if the local install is 18.04

    # Setup your computer to accept software from packages.ros.org
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    
    # Setup keys
    sudo apt install curl # if you haven't already installed curl
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

    # Install full
    sudo apt update
    sudo apt install ros-melodic-desktop-full

    # Source melodic
    source /opt/ros/melodic/setup.bash

    # Install dependencies
    sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

    sudo apt install python-rosdep
    sudo rosdep init
    rosdep update
}

setup_bash $1 $2 $3
