{ mkDerivation, stdenv, pkgs, fetchFromGitHub, base, aeson, basic-prelude, download, file-embed, git-embed, glob-posix, network, network-info, optparse-applicative, rainbow, safe, scientific, strict, text, unordered-containers, vector, xdg-basedir, tasty, tasty-hunit, ... }:

let
  glob-not-checked = pkgs.haskell.lib.dontCheck glob-posix;
in
  mkDerivation rec {
    pname = "powerline-hs";
    version = "0.1.3.0";
    src = pkgs.fetchgit {
      url = "https://github.com/rdnetto/powerline-hs.git";
      rev = "v${version}";
      sha256 = "1h0ifz7xpj0vrxvzxw0jijbl9gi6yx1yfg3xxxi5x61jy4k4bygq";
      fetchSubmodules = true;
      leaveDotGit = true;
      deepClone = true;
    };
    isLibrary = false;
    isExecutable = true;
    executableHaskellDepends = [
      base
      aeson
      basic-prelude
      aeson
      basic-prelude
      download
      file-embed
      git-embed
      glob-not-checked
      network
      network-info
      optparse-applicative
      rainbow
      safe
      scientific
      strict
      tasty
      tasty-hunit
      text
      unordered-containers
      vector
      xdg-basedir
    ];
    doCheck = false;
    executableSystemDepends = [ pkgs.git ];
    license = stdenv.lib.licenses.asl20;
  }
