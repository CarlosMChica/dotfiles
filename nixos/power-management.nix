{ config, pkgs, ... }:

{
  services.logind.extraConfig =
    ''
    IdleAction=suspend
    IdleActionSec=1200
  '';
}
