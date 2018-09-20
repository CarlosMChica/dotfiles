{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    ponymix
    blueman
  ];

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    # Only the full build has Bluetooth support, so it must be selected here.
    package = pkgs.pulseaudioFull;
  };
}
