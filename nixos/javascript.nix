{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    yarn2nix
    nodePackages.tern
    sass
    nodePackages.grunt-cli
  ];
}
