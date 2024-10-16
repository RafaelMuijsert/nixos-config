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
      startup = let 
        lockScreen = pkgs.writeShellApplication {
          name = "sway-lockscreen";
          text = ''
              #!/bin/sh
              swayidle -w \
                timeout 30 "swaymsg output '*' dpms off" \
                resume "swaymsg output '*' dpms on" &

              # Lock screen
              ${pkgs-unstable.hyprlock}/bin/hyprlock
              pkill --newest swayidle
          '';
        };
      in [
        { command = "swayidle -w timeout 180 '${lockScreen}/bin/sway-lockscreen'"; }
      ];
    };
    extraConfig = lib.mkIf osConfig.isLaptop (
      lib.concatLines [
        "bindswitch --reload --locked lid:off output eDP-1 enable"

        "bindswitch --reload --locked lid:on output eDP-1 disable; exec ${pkgs-unstable.hyprlock}/bin/hyprlock"
      ]
    );
  };
}
