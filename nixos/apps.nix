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
    slack
  ];

}
