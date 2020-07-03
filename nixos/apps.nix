{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dropbox
    evince
    pinta
    beancount
    libreoffice
    transmission_gtk
    vlc
    baobab
    gnome3.file-roller
    steam
    slack
  ];

  hardware.opengl = { # this fixes the "glXChooseVisual failed" bug, context: https://github.com/NixOS/nixpkgs/issues/47932
    enable = true;
    driSupport32Bit = true;
  };
}
