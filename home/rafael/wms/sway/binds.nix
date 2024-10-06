{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    config.keybindings = let
      modifier = "Mod1";
      scSetVolume = pkgs.writeShellApplication {
        name = "sc-set-volume";
        text = ''
          #!/bin/sh
          wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"
          volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%%", $2 * 100}')
          ${pkgs.libnotify}/bin/notify-send -t 3000 -h "int:value:$volume" -h string:x-canonical-private-synchronous:volume "Volume" "$volume"
        '';
      };
      scSetBrightness = pkgs.writeShellApplication {
        name = "sc-set-brightness";
        text = ''
          #!/bin/sh
          brightness=$(${pkgs.brightnessctl}/bin/brightnessctl set "$1" | grep -oP '\(\K\d+%')
          ${pkgs.libnotify}/bin/notify-send -t 3000 -h "int:value:$brightness" -h string:x-canonical-private-synchronous:brightness "Brightness" "$brightness"
        '';
      };
      scScreenshot = pkgs.writeShellApplication {
        name = "sc-screenshot";
        text = ''
          #!/bin/sh
          ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$HOME/Pictures/Screenshots/$(date +%s).png"
        '';
      };
    in {
      "${modifier}+Return" = "exec $TERMINAL";
      "${modifier}+Shift+q" = "kill";
      "${modifier}+space" = "exec $LAUNCHER";
      "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Do you want to exit Sway?' -b 'Yes' 'swaymsg exit'";
      "${modifier}+i" = "exec $BROWSER";

      "XF86AudioRaiseVolume" = "exec ${scSetVolume}/bin/sc-set-volume 1%+";
      "XF86AudioLowerVolume" = "exec ${scSetVolume}/bin/sc-set-volume 1%-";
      "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      "XF86MonBrightnessUp" = "exec ${scSetBrightness}/bin/sc-set-brightness 1%+";
      "XF86MonBrightnessDown" = "exec ${scSetBrightness}/bin/sc-set-brightness 1%-";

      "Print" = "exec ${scScreenshot}/bin/sc-screenshot";


      "${modifier}+1" = "workspace number 1";
      "${modifier}+2" = "workspace number 2";
      "${modifier}+3" = "workspace number 3";
      "${modifier}+4" = "workspace number 4";
      "${modifier}+5" = "workspace number 5";
      "${modifier}+6" = "workspace number 6";
      "${modifier}+7" = "workspace number 7";
      "${modifier}+8" = "workspace number 8";
      "${modifier}+9" = "workspace number 9";
      "${modifier}+0" = "workspace number 10";

      "${modifier}+Shift+1" = "move container to workspace number 1";
      "${modifier}+Shift+2" = "move container to workspace number 2";
      "${modifier}+Shift+3" = "move container to workspace number 3";
      "${modifier}+Shift+4" = "move container to workspace number 4";
      "${modifier}+Shift+5" = "move container to workspace number 5";
      "${modifier}+Shift+6" = "move container to workspace number 6";
      "${modifier}+Shift+7" = "move container to workspace number 7";
      "${modifier}+Shift+8" = "move container to workspace number 8";
      "${modifier}+Shift+9" = "move container to workspace number 9";
      "${modifier}+Shift+0" = "move container to workspace number 10";

      "${modifier}+f" = "fullscreen toggle";

      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+l" = "focus right";

      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+l" = "move right";
    };
    config.defaultWorkspace = "workspace number 1";
  };
}
