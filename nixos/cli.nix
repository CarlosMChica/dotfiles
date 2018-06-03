{ config, pkgs, ... }:

let
 powerline-hs = pkgs.callPackage ./pkgs/powerline-hs { };
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
    powerline-hs
  ];

  programs.bash.enableCompletion = true;
}
