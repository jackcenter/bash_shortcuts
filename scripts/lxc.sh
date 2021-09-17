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
    sleep ls
  fi

  clear
  lxc exec "$1" -- sudo --user ubuntu --login
}
