{ config, pkgs, ... }:

let
  tomcat7-0-42 = pkgs.stdenv.lib.overrideDerivation pkgs.tomcat7 (oldAttrs : {
    name = "apache-tomcat-7.0.42";
    version = "7.0.42";
    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.42/bin/apache-tomcat-7.0.42.tar.gz";
      sha256 = "1prn3jcxvykddl4b430jn3zvflssw3k9d38dricw43qqsxigfqy1";
    };
});
in
{
  #mangoshop
  networking.hosts = {
    "127.0.0.1" = [ "localhost.mango.com" "litedb" "localhost.mangooutlet.com"];
  };

  programs.java = {
    enable = true;
    package = pkgs.stable.openjdk7;
  };

  environment.systemPackages = with pkgs; [
    maven
    gradle
    jetbrains.idea-ultimate

    #mangoshop
    subversion
    tomcat7-0-42
  ];
}
