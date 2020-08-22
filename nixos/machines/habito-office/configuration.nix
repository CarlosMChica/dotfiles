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
      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
      };
    };
    initrd.luks.devices = [
      {
        name = "root";
        # blkid gives you back the disk id
        device = "/dev/disk/by-uuid/624e2092-b6bf-46c8-87a4-467a73c0eff6";
        preLVM = true;
        allowDiscards = true;
      }
    ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

}
