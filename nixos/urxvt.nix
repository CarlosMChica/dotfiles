{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    urxvt_vtwheel
    urxvt_font_size
    rxvt_unicode
  ];

  systemd.user.services.urxvtd = {
    enable = true;
  };
}
