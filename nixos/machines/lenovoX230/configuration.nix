{ config, pkgs, ... }:

{
	imports =
		[
			../../common.nix
      ./hardware-configuration.nix
		];

  networking.hostName =  "lenovox230-nix";

  # SSD options
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  boot = {
    loader = {
      grub.enable = true;
      grub.version = 2;
      grub.device = "/dev/sda";
    };
    initrd.luks.devices = [
      {
        name = "root";
        # blkid gives you back the disk id
        device = "/dev/disk/by-uuid/10c91e62-3bc3-468b-9be8-47dc29138712";
        preLVM = true;
        allowDiscards = true;
      }
    ];
  };

}
