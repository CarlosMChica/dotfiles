{ config, pkgs, ... }:

let
  hieNix = import (fetchTarball { url = "https://github.com/domenkozar/hie-nix/tarball/master"; }) {};
in
{
  environment.systemPackages = with pkgs; [
    stack
    haskellPackages.ghc
    haskellPackages.cabal-install
    haskellPackages.hindent
    haskellPackages.stylish-haskell
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.cabal2nix
    hieNix.hies
    cachix
  ];
  nix = {
    binaryCaches = [
      "https://cache.nixos.org/"
      "https://hie-nix.cachix.org"
    ];
    binaryCachePublicKeys = [
      "hie-nix.cachix.org-1:EjBSHzF6VmDnzqlldGXbi0RM3HdjfTU3yDRi9Pd0jTY="
    ];
    trustedUsers = [ "root" "carlos" ];
  };

}
