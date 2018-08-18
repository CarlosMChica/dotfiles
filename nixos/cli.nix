{ config, pkgs, ... }:

let
  powerline-hs = pkgs.haskellPackages.callPackage ./pkgs/powerline-hs { };
in
{
  environment.systemPackages = with pkgs; [
    shellcheck
    autojump
    exa
    dropbox-cli
    unzip
    unrar
    jq
    neofetch
    speedtest-cli
    ranger
    w3m
    ffmpegthumbnailer
    atool
    neomutt
    taskwarrior
    tasksh
    xsel
    lm_sensors
    ag
#    powerline-hs
    #python36Packages.powerline
    powerline-go
    nix-prefetch-git
  ];

  programs.bash.enableCompletion = true;
}
