{ config, pkgs, ... }:

{

  networking = {
    networkmanager.enable = true;
  };

  networking.firewall.enable = false;
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
