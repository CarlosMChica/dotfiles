{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs
    zeal
  ];
}
