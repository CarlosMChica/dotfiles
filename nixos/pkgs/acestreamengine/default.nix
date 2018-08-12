{stdenv, pkgs, python27Packages}:

stdenv.mkDerivation rec {
  name = "acestreamengine";
  version = "3.1.16";
  src = ./acestream_3.1.16_ubuntu_16.04_x86_64.tar.gz;
 # src = pkgs.fetchurl {
 #   url = "http://dl.acestream.org/linux/acestream_${version}_ubuntu_16.04_x86_64.tar.gz";
 #   sha256 = "1h0ifz7xpj0vrxvzxw0jijbl9gi6yx1yfg3xxxi5x61jy4k4bygq";
 # };

  libPath = stdenv.lib.makeLibraryPath [
    python27Packages.python
    python27Packages.apsw
    python27Packages.setuptools
	  python27Packages.m2crypto
	  python27Packages.xlib
  ];

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p "$out/opt/acestreamengine"
    cp -r acestream.conf acestreamengine data/ lib/ "$out/opt/acestreamengine"
    chmod +x "$out/opt/acestreamengine/acestreamengine"

    patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) --set-rpath "$libPath" "$out/opt/acestreamengine/acestreamengine"

    mkdir "$out/bin"
    ln -s "$out/opt/acestreamengine/acestreanengine" "$out/bin/acestreamengine"
  '';
}
