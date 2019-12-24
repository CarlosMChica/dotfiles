{ pkgs, ... }:

let
  emacs = pkgs.emacs.overrideAttrs (old: {
    src = pkgs.fetchgit {
      url = "https://github.com/emacs-mirror/emacs.git";
      rev = "ef0fc0bed1c97a1c803fa83bee438ca9cfd238b0";
      sha256 = "0jv9vh9hrx9svdy0jz6zyz3ylmw7sbf0xbk7i80yxbbia2j8k9j2";
      fetchSubmodules = false;
    };
    patches = [ ];
    version = "27";
    name = "emacs-27";
    # override = { srcRepo = true; };
  });
  # emacs = pkgs.emacs.overrideAttrs (old: {
  #   src = pkgs.fetchgit {
  #     url = "https://github.com/emacs-mirror/emacs.git";
  #     rev = "ef0fc0bed1c97a1c803fa83bee438ca9cfd238b0";
  #     sha256 = "0jv9vh9hrx9svdy0jz6zyz3ylmw7sbf0xbk7i80yxbbia2j8k9j2";
  #     fetchSubmodules = false;
  #   };
  #   patches = [ ];
  #   version = "27";
  #   name = "emacs";
  #   override = { srcRepo = true; };
  # });

in
{
  environment.systemPackages = with pkgs; [
    emacs
    sqlite # Required by helm-dash
  ];
}
