{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virtualbox
    linuxHeaders
    docker_compose
  ];
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
}
