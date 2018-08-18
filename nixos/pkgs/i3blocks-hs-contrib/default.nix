{ mkDerivation, aeson, attoparsec, base, hspec, lens, lens-aeson
, QuickCheck, stdenv, text, turtle, wreq, pkgs
}:
mkDerivation rec {
  pname = "i3blocks-hs-contrib";
  version = "0.1.0.0";
  src = pkgs.fetchgit {
    url = "https://github.com/PaNaVTEC/i3blocks-hs-contrib";
    rev = "5ac731ffcd839e599c2c19f6bd6683c9f8fed14e";
    sha256 = "0hd3pvi7ydyhsi5nb73fiwl27pchax6mzh9kc3xaqw4in5n8dicx";
    fetchSubmodules = false;
  };

  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson attoparsec base lens lens-aeson text turtle wreq
  ];
  testHaskellDepends = [ base hspec QuickCheck ];
  homepage = "https://github.com/panavtec/i3blocks-hs-contrib#readme";
  license = stdenv.lib.licenses.bsd3;
}
