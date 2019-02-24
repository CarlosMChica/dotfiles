{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rambox
    franz
  ];

}
