: "${1?"Missing 'MACHINE_NAME' - Usage: $0 'lenovoX230'"}"

MACHINES_CONFIG="/home/carlos/dotfiles/nixos/machines/"
MACHINE_NAME=$1

sudo stow "$MACHINE_NAME" -d "$MACHINES_CONFIG" -t /etc/nixos/
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --add https://nixos.org/channels/nixos-18.09 stable
sudo nix-channel --update nixos
sudo nix-channel --update stable
