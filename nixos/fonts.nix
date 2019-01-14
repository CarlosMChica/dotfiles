{ config, pkgs, ... }:

let
  terminus-td1 = pkgs.stdenv.lib.overrideDerivation pkgs.terminus_font (oldAttrs : {
    patchPhase = ''
      patch < alt/td1.diff
    '' + oldAttrs.patchPhase;
  });
in
{
  fonts = {
    fonts = with pkgs; [
      terminus-td1
      twemoji-color-font
      google-fonts
      noto-fonts-emoji
      symbola
      nerdfonts
      font-awesome-ttf
    ];
  };
}
