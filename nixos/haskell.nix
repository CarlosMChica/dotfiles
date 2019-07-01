{ config, pkgs, ... }:

let
  purs = pkgs.callPackage ./pkgs/purs { };
in

{
  environment.systemPackages = with pkgs; [
    haskellPackages.ghc
    haskellPackages.stack
    haskellPackages.cabal-install
    haskellPackages.hindent
    haskellPackages.stylish-haskell
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.cabal2nix

    purs
  ];

}
