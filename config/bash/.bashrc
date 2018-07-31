#!/bin/bash
set -o vi

export XDG_CONFIG_HOME=$HOME/.config
export BROWSER=google-chrome-stable
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export DOTFILES_LOCATION=$HOME/dotfiles

source "$HOME/.env.sh"
source "$DOTFILES_LOCATION/programming/index.sh"
source "$DOTFILES_LOCATION/finance/index.sh"
source "$DOTFILES_LOCATION/system/index.sh"
source "$DOTFILES_LOCATION/system/paths.sh"
source "$DOTFILES_LOCATION/system/prompt.sh"
[ -f "$HOME/.bash_shortcuts" ] && source "$HOME/.bash_shortcuts"

if [[ $(uname) == "Linux" ]]; then
  setxkbmap -layout us -variant altgr-intl -option nodeadkeys
  eval $(dircolors ~/.dircolors)
fi
