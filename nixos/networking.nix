{ config, pkgs, ... }:

{

  networking = {
    networkmanager.enable = true;
    nameservers = ["208.67.222.222" "208.67.220.220"];
    firewall.enable = false;
# check if the following line helps accesing sport365 from home
#    networking.dnsExtensionMechanism
    enableIPv6 = false;
  };
  services.openvpn.servers = {
    secondaryVPN = {
      config = '' config /home/carlos/Downloads/secondary.ovpn '';
      autoStart = false;
    };
    primaryVPN = {
      config = '' config /home/carlos/Downloads/primary.ovpn '';
      autoStart = true;
    };
  };

  environment.systemPackages = with pkgs; [
    iw
    networkmanagerapplet
    bind
    wirelesstools
    wireguard
    linuxHeaders
  ];
}
