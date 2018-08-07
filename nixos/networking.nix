{ config, pkgs, ... }:

let
  userModule = (import ./user.nix);
  hostname = userModule.hostname;
  wireguardInterfaces = userModule.wireguardInterfaces;
in
{
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    wireguard.interfaces = wireguardInterfaces;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 8080 80 3000 ];
  # networking.firewall.allowedUDPPorts = [ ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
