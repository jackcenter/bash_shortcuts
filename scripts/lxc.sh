#!/bin/bash -eu

# Starts the lxc if it is stopped and executes the container
#
# Inputs: lxc container name
function lxc_open
{
  lxc_status=$(lxc list --format csv --columns ns | grep "$1")
  echo "${lxc_status}"

  if [ "$lxc_status" != ""$1",RUNNING" ]; then
    lxc start "$1"
    sleep 1s
  fi

  clear
  lxc exec "$1" -- sudo --user ubuntu --login
}

function lxc_setup
{
  local CONTAINER_NAME=${1:-unnammed}

  # Create and start the container
  lxc launch --profile default --profile gui ubuntu:18.04 ${CONTAINER_NAME} && wait

  # Copy local ssh key to the container
  lxc file push ~/.ssh/id_ed25519.pub ${CONTAINER_NAME}/home/ubuntu/.ssh/authorized_keys
  lxc file push ~/.ssh/id_ed25519.pub ${CONTAINER_NAME}/home/ubuntu/.ssh
  lxc file push ~/.ssh/id_ed25519 ${CONTAINER_NAME}/home/ubuntu/.ssh

  # TODO: setup .bashrc from here
  # 1. clone bash_shortcuts
  # 2. create a temp file for .bashrc
  # 3. push the temp file to the container .bashrc

  lxc_open ${CONTAINER_NAME}
}
