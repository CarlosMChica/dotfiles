{ config, pkgs, ... }:

let
  powerline-hs = pkgs.haskellPackages.callPackage ./pkgs/powerline-hs { };
in
{
  environment.systemPackages = with pkgs; [
    shellcheck
    autojump
    exa
    unzip
    unrar
    jq
    neofetch
    speedtest-cli
    ranger
    w3m
    ffmpegthumbnailer
    atool
#    neomutt
    taskwarrior
    tasksh
    xsel
    lm_sensors
    ag
    awscli
    powerline-go
    nix-prefetch-git
    bat
    youtube-dl
    appimage-run
  ];

  programs = {
    bash.enableCompletion = true;
    tmux.enable = true;
  };
}
