{ config, pkgs, ... }:

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
    exfat
    bazel
    yank
  ];

  programs = {
    bash.enableCompletion = true;
    tmux.enable = true;
  };
}
