#!/usr/bin/env bash

export PROMPT_DIRTRIM=2

function _update_ps1() {
  PS1="$(powerline-go \
   -numeric-exit-codes \
   -modules cwd,git,jobs,perms,ssh,nix-shell,exit,root \
   -error $?)"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
