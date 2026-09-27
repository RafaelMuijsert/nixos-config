{ lib, ... }:
{
  options.domain = lib.mkOption {
    type = lib.types.str;
    default = "muijsert.org";
  };

  options.media-drive = lib.mkOption {
    type = lib.types.str;
    default = "/mnt/data";
  };
}
