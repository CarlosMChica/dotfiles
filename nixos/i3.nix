{ config, pkgs, ... }:

{

  services.fractalart.enable = true;
  services.xserver = {
    displayManager.gdm.enable = true;
    enable = true;
    layout = "us";
    exportConfiguration = true;
    libinput = {
      disableWhileTyping = true; # doesn't work
      enable = true;
    };
    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraSessionCommands = ''
        dropbox &
        parcellite -n &
        google-chrome-stable &
        slack &
        nm-applet &
      '';
    };
  };

  services.picom = {
    enable = true;
    settings = {
      inactive-opacity = 0.95;
      inactive-dim = 0.4;
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xkill
    xorg.xbacklight
    xorg.xwininfo
    acpi

    dmenu

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
    parcellite
    masterpdfeditor
    nitrogen
    xorg.xvinfo
    ];
}
