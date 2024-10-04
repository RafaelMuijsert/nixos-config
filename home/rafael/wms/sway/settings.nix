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
    extraConfig = lib.mkIf osConfig.isLaptop (
      lib.concatLines [
        "bindswitch --reload --locked lid:off output eDP-1 enable"
        "bindswitch --reload --locked lid:on output eDP-1 disable"
      ]
    );
  };
}
