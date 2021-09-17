#!/bin/bash -eu

# Show the current git branch
function parse_vc_branch_and_add_brackets 
{
  gitbranch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'`

  if [[ "$gitbranch" != '' ]]; then
    echo $gitbranch
  else
    hg branch 2> /dev/null | awk '{print $1 }'
  fi
}

export PS1="\[\033[$COLOR_0\][\h]\[\033[0m\]\[\033[$COLOR_1\]\$(parse_vc_branch_and_add_brackets)\[\033[$COLOR_2\] \W$ "