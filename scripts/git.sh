#!/bin/bash -eu

# Show the current git branch
function parse_vc_branch_and_add_brackets {
  gitbranch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'`

  if [[ "$gitbranch" != '' ]]; then
    echo $gitbranch
  else
    hg branch 2> /dev/null | awk '{print $1 }'
  fi
}
export PS1="\[\033[34m\][\h]\[\033[0m\]\[\033[0;32m\]\$(parse_vc_branch_and_add_brackets)\[\033[0m\] \W$ "
