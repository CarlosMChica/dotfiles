{ config, pkgs, ... }:

let
  n = pkgs.callPackage ./pkgs/npackagemanager { };
  variety = pkgs.callPackage ./pkgs/variety { };
  acestreamengine = pkgs.callPackage ./pkgs/acestreamengine { };
in
{
  imports =
    [
      ./networking.nix
      ./i3.nix
      ./urxvt.nix
      ./fonts.nix
      ./apps.nix
      ./emacs.nix
      ./scala.nix
      ./java.nix
      ./haskell.nix
      ./git.nix
      ./virtualization.nix
      ./containerization.nix
      ./security.nix
      ./web-browsers.nix
      ./golang.nix
      ./cli.nix
      ./messaging.nix
      ./audio.nix
      ./python.nix
      ./javascript.nix
      ./users.nix
    ];

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search, run:
  # $ nix search

  environment.systemPackages = with pkgs; [
    wget vim htop imagemagick n gnumake binutils variety # acestreamengine
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver = {
    enable = true;
    layout = "us";
  };
  # Enable touchpad support.
  # services.xserver.libinput.enable = true;
  security.sudo.configFile = "%wheel ALL=(ALL) ALL";

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system = {
    stateVersion = "18.03"; # Did you read the comment?
    autoUpgrade.enable = true;
  };

}
