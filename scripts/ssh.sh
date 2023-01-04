#!/bin/bash -eu

function ssh_agent_start
{
  eval "$(ssh-agent -s)"

  if [ "$#" == 0 ]; then
    ssh-add ~/.ssh/id_ed25519
  elif [ "$#" == 1 ]; then
    ssh-add $1
  else
    echo "Illegal number of arguments."
  fi
}