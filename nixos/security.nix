{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    keepass
    keepass-keepasshttp
    keepassxc
  ];

  services.physlock.enable = true;
  services.physlock.allowAnyUser = true;
}
