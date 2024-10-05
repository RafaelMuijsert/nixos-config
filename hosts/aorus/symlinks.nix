{ config, ... }:
{
  home.file = {
    "Downloads".source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/Downloads";
  };
}

