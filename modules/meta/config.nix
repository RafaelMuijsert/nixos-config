{ lib, ... }:
{
  options = {
    domain = lib.mkOption {
      type = lib.types.str;
      default = "muijsert.org";
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
