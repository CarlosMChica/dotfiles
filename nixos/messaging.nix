{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    slack
    rambox
  ];

}
