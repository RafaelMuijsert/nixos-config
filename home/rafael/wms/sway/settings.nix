{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    config = {
      modifier = "Mod4";
      output = {
        "*" = {
          scale = "1";
          bg = "${osConfig.desktop.theme.wallpaper} fill";
        };
      };
      window = {
        border = 1;
        titlebar = false;
      };
      startup = [];
    };
  };
}
