: "${1?"Missing 'MACHINE_NAME' - Usage: $0 'lenovoX230'"}"

MACHINES_CONFIG="/home/carlos/dotfiles/nixos/machines/"
MACHINE_NAME=$1

sudo stow nixos -t /etc/nixos/
sudo stow "$MACHINE_NAME" -d "$MACHINES_CONFIG" -t /etc/nixos/
