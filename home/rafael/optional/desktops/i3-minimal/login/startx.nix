{ config, lib, osConfig, ... }:
{
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    home.file.".xinitrc".text = "exec i3";
  };
}

