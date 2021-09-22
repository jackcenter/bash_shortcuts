#!/bin/bash

# Replaces ~/.bashrc with the user defined BASHRC_ENV and BASHRC_NAME variables and adds the sourceing 
# for the bash_shortcuts/.my.bashrc.
function setup_bash 
{
    local ENV_VAL=${1:-none}
    local NAME_VAL=${2:-none}
    echo "export BASHRC_ENV=$ENV_VAL && export BASHRC_NAME=$NAME_VAL && . ~/bash_shortcuts/.my.bashrc" > ~/.bashrc
    source ~/.bashrc
}

setup_bash $1 $2
