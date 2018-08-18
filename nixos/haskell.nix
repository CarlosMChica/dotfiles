{ config, pkgs, ... }:

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
    haskellPackages.stack2nix
  ];
}
