{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rxvt_unicode-with-plugins
  ];

  systemd.user.services.urxvtd = {
    enable = true;
  };
}
