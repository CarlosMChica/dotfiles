#!/usr/bin/env bash

export PROMPT_DIRTRIM=2

function _update_ps1() {
  POWERLINE_GO=$(which powerline-go)
  PS1="$($POWERLINE_GO  \
         -error $? \
         -modules "user,cwd,git,exit,jobs,perms,root,ssh,nix-shell")"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
