{ config, pkgs, ... }:

{

  networking = {
    networkmanager.enable = true;
    wireguard.interfaces = wireguardInterfaces;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 8080 80 3000 ];
  # networking.firewall.allowedUDPPorts = [ ];
  # Or disable the firewall altogether.

  networking.firewall.allowedTCPPorts = [ 5556 5558 ];

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
