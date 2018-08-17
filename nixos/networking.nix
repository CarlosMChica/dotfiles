{ config, pkgs, ... }:

{

  networking = {
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    iw
    networkmanagerapplet
    openresolv
    bind
    wirelesstools
    wireguard
    linuxHeaders
  ];
}
