#!/bin/bash -e

relativePath="$DOTFILES_LOCATION/system"
source "$relativePath/update.sh"
source "$relativePath/wifi.sh"
source "$relativePath/bluetooth.sh"
source "$relativePath/sound.sh"
source "$relativePath/screen.sh"

if [[ $(uname) == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias ll='exa'
alias la='ll'
alias exa='exa -bghlaU --git --group-directories-first'
alias grep="grep --color=auto"
alias connectvpn='sudo toggle-openvpn.sh'
alias dotfiles='(cd "$DOTFILES_LOCATION" && emacs -nw)'
alias ffs='sudo $(fc -ln -1)'
alias shortcuts="$DOTFILES_LOCATION/config/shortcuts/shortcuts.sh"
alias cls='printf "\033c"'
alias wgup='sudo wg-quick up wg0-client'
alias wgdown='sudo wg-quick down wg0-client'
alias wgCoduranceUp='sudo wg-quick up codu-client'
alias wgCoduranceDown='sudo wg-quick down codu-client'
alias ovpnup='systemctl start openvpn-haskellVPN.service'
alias ovpndown='systemctl stop openvpn-haskellVPN.service'
alias ovpnCoduranceUp='systemctl start openvpn-coduranceVPN.service'
alias ovpnCoduranceDown='systemctl stop openvpn-coduranceVPN.service'
alias mountWindows='sudo mount /dev/sda4 /windows'
alias emptyTrash='rm -rf ~/.local/share/Trash/*'
alias restartX='systemctl restart lightdm'

autogeneratePassword () {
  LC_CTYPE=C tr -dc "[:alnum:]" < /dev/urandom | fold "-w${1:-32}" | head -1
}

every() {
  watch -c -n "$1" "$2"
}

up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [[ -z "$d" ]]; then
    d=..
  fi
  cd $d
}

kernelModuleParameters() {
  cat /proc/modules | cut -f 1 -d " " | while read module; do \
    echo "Module: $module"; \
    if [ -d "/sys/module/$module/parameters" ]; then \
      ls /sys/module/$module/parameters/ | while read parameter; do \
      echo -n "Parameter: $parameter --> "; \
      cat /sys/module/$module/parameters/$parameter; \
    done; \
  fi; \
  echo; \
done
}

killByName() {
  pkill "$1"
}

showPublicIp() {
  local content
  local ip
  local city
  local country
  content=$(curl -s ipinfo.io/)
  ip=$(echo "$content" | jq -r .ip)
  city=$(echo "$content" | jq -r .city)
  country=$(echo "$content" | jq -r .country)
  echo "$ip - $city ($country)"
}

showListeningPorts() {
  sudo netstat -tulpn | grep LISTEN
}

backupSystem() {
  rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / $1
}

alias trayer='trayer --width 30 --widthtype pixel --SetDockType false --edge top --align center'

cpuDrainers() {
  ps aux --sort %cpu | tail -5 | cut -c 22-150
}

setTermiteTitle() {
  echo `tput tsl` $1  `tput fsl`
}

forceHwClock() {
  #$1 = 2018-03-15
  sudo hwclock --set --date "$1"
  sudo systemctl restart systemd-timesyncd.service
}

portOfProcessNamed() {
  netstat -tlpn  | grep "$1"
}

updateDns() {
  sudo resolvconf -u
}

findFileByContent() {
  sudo grep -rinl "$2" -e "$1"
}

findFileByName() {
  sudo find "$2" -iname "*$1*" -type f
}

disableIpV6() {
  sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/wlp3s0/disable_ipv6'
}

showProcessPort() {
  netstat -tlpn  | grep "$1"
}

showLargestFiles() {
  if [[ -n "$1" ]]; then
    COUNT=$1
  else
    COUNT=5
  fi
  sudo find -type f -exec du -Sh {} + | sort -rh | head -n $COUNT
}
