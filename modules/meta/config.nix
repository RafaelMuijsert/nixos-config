{ config, lib, ... }:
{
  options = {
    domain = lib.mkOption {
      type = lib.types.str;
      default = "muijsert.org";
    };

    internal-domain = lib.mkOption {
      type = lib.types.str;
      default = "internal.${config.domain}";
    };

    vpn-domain = lib.mkOption {
      type = lib.types.str;
      default = "vpn.${config.domain}";
    };

    timezone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Amsterdam";
    };

    media-drive = lib.mkOption {
      type = lib.types.str;
      default = "/mnt/data";
    };

    github-username = lib.mkOption {
      type = lib.types.str;
      default = "RafaelMuijsert";
    };
  };
}
