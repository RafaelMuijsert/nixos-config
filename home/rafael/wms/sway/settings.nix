{
  config,
  lib,
  osConfig,
  pkgs,
  pkgs-unstable,
  ...
}: {
  wayland.windowManager.sway = {
    config = {
      modifier = "Mod1";
      output = {
        "*" = {
          scale = "1";
        };
      };
      input = {
        "type:keyboard" = {
          repeat_delay = "200";
          repeat_rate = "30";
        };
      };
      window = {
        border = 1;
        titlebar = false;
      };
    };
    extraConfig = lib.mkIf osConfig.isLaptop (
      lib.concatLines [
        "bindswitch --reload --locked lid:off output eDP-1 enable"
        "bindswitch --reload --locked lid:on output eDP-1 disable"
      ]
    );
  };
}
