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
      modifier = "Mod4";
      output = {
        "*" = {
          scale = "1";
        };
      };
      input = {
        "type:keyboard" = {
          repeat_delay = "200";
          repeat_rate = "30";
          xkb_options = "caps:swapescape";
        };
        "type:touchpad" = {
          tap = "enabled";
          dwt = "disabled";
        };
      };
      window = {
        border = 0;
        titlebar = false;
      };
      startup = [
        # Use logind idle configuration
        {command = "swayidle idlehint 1";}
        # Auto-execute programs
        {command = "${pkgs.telegram-desktop}/bin/telegram-desktop";}
        {command = "${pkgs.thunderbird}/bin/thunderbird";}
      ];
    };
    extraConfig = lib.mkIf osConfig.isLaptop (
      lib.concatLines [
        "bindswitch --reload --locked lid:off output eDP-1 enable"
        "bindswitch --reload --locked lid:on output eDP-1 disable"
      ]
    );
  };
}
