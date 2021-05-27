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
    authy
    kodi
    tvheadend
    kodiPlugins.pvr-iptvsimple
  ];

  services.xserver.desktopManager.kodi.enable = true;
}
