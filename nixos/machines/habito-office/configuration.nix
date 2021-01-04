{ config, pkgs, ... }:

{
  imports =
    [
      ../../common.nix
      /etc/nixos/hardware-configuration.nix
    ];

  networking.hostName =  "habito-office";

  # SSD options
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices = {
      root = {
        device = "/dev/disk/by-uuid/624e2092-b6bf-46c8-87a4-467a73c0eff6";
        preLVM = true;
        allowDiscards = true;
      };
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  fileSystems."/data" =
  { device = "/dev/disk/by-uuid/bac04cbe-8c31-4ab9-959b-7ca571796e0f";
    fsType = "ext4";
  };

  virtualisation.docker = {
    extraOptions = "--data-root /data/docker";
  };

  systemd.extraConfig = ''
    ShutdownWatchdogSec=20s
  '';

}
