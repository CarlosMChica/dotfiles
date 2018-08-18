#!/usr/bin/env bash

export PROMPT_DIRTRIM=2

#powerline-daemon -q
#POWERLINE_COMMAND=$(which powerline-hs)
#POWERLINE_CONFIG_COMMAND=$(which true)
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#POWERLINE_PATH=$(readlink -f "$(which powerline)")
#. "${POWERLINE_PATH%bin/*}/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh"

function _update_ps1() {
  POWERLINE_GO=$(which powerline-go)
  PS1="$($POWERLINE_GO  \
         -error $? \
         -modules "user,cwd,git,exit,jobs,perms,root,ssh,nix-shell")"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
