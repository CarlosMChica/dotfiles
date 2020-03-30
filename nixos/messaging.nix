{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rambox
   	zoom-us
  ];

}
