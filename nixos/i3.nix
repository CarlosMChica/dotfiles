{ config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    package = pkgs.i3-gaps;
    enable = true;
    extraSessionCommands = ''
      compton -c -i 0.95 -b &
      dropbox &
      parcellite -n &
      google-chrome-stable &
      slack &
      rambox &
      nm-applet &
    '';
  };

  environment.systemPackages = with pkgs; [
    xorg.xkill
    xorg.xbacklight
    xorg.xwininfo
    acpi

    dmenu
    j4-dmenu-desktop

    dunst

    i3blocks
    sysstat

    i3lock-pixeled
    arandr
    feh
    maim
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-dropbox-plugin
    xfce.thunar-archive-plugin
    compton
    parcellite

    transmission_gtk
    vlc
    ];
}
