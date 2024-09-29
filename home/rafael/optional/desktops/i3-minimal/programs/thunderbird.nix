{ config, lib, osConfig, ... }:
{
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs.thunderbird = {
      enable = true;
      profiles.rafael = {
        isDefault = true; 
      };
    };
  };
}
