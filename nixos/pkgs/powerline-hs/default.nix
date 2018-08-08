{ mkDerivation, aeson, base, basic-prelude, bytestring, containers
, criterion, directory, download, file-embed, filepath, git-embed
, glob-posix, MissingH, network, network-info, optparse-applicative
, process, rainbow, safe, scientific, stdenv, strict, tasty
, tasty-hunit, template-haskell, text, time, transformers, unix
, unordered-containers, vector, xdg-basedir, pkgs
}:

#{ mkDerivation, stdenv, pkgs, fetchFromGitHub, base, aeson, basic-prelude, download, file-embed, git-embed, glob-posix, network, network-info, optparse-applicative, rainbow, safe, scientific, strict, text, unordered-containers, vector, xdg-basedir, tasty, tasty-hunit, ... }:

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
    enableSharedExecutables = false;
    enableSharedLibraries = false;
    executableHaskellDepends = [
      aeson base basic-prelude bytestring containers directory download
      file-embed filepath git-embed glob-not-checked network network-info
      optparse-applicative process rainbow safe scientific strict
      template-haskell text time transformers unix unordered-containers
      vector xdg-basedir
    ];
    testHaskellDepends = [
      base basic-prelude process tasty tasty-hunit
    ];
    benchmarkHaskellDepends = [ base criterion MissingH process ];
    doCheck = false;
    executableSystemDepends = [ pkgs.git ];
    homepage = "https://github.com/rdnetto/powerline-hs";
    description = "Powerline-compatible shell prompt generator";
    license = stdenv.lib.licenses.asl20;
  }
