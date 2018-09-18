{ config, pkgs, ... }:

{

  networking = {
    networkmanager.enable = true;
    nameservers = ["208.67.222.222" "208.67.220.220"];
    firewall.enable = false;
  };
  services.openvpn.servers = {
    coduranceVPN = {
      config = '' config /home/carlos/Downloads/34.242.136.162-direct.ovpn '';
      autoStart = false;
    };
    haskellVPN = {
      config = '' config /home/carlos/Downloads/188.166.3.148-direct.ovpn '';
      autoStart = false;
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
