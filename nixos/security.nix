{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    keepass
    keepass-keepasshttp
    keepassxc
  ];

}