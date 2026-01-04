{ lib, osConfig, pkgs, ...}:
{
  config = lib.mkIf osConfig.academia {
    home.packages = [
      pkgs.eduvpn-client
    ];
  };

}
