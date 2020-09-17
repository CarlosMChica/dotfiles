{ config, pkgs, ... }:

{

   environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_SIZE= "128";
   };

   services.xserver = {
    displayManager = {
      gdm.enable = true;
    };
    dpi = 144;
    enable = true;
    layout = "us";
    exportConfiguration = true;
    libinput = {
      disableWhileTyping = true;
      enable = true;
    };
    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraSessionCommands = ''
        parcellite -n &
        google-chrome-stable &
        slack &
        nm-applet &
      '';
    };
  };

  services.picom = {
    enable = true;
    backend = "glx";
    settings = {
      inactive-opacity = 0.95;
      inactive-dim = 0.4;
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xkill
    xorg.xbacklight
    xorg.xwininfo
    xorg.xdpyinfo
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
    lxappearance
    xorg.xcursorthemes
    vanilla-dmz
  ];

}
