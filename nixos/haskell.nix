{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskell.compiler.ghc862
    stack
    haskellPackages.cabal-install
    haskellPackages.hindent
    haskellPackages.stylish-haskell
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.cabal2nix

    purescript
  ];

}
