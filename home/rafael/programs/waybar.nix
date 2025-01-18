{
  programs.waybar = {
    settings.mainBar = {
      height = 30;
      modules-left = ["hyprland/workspaces" "systemd-failed-units"];
      modules-center = ["hyprland/window"];
      modules-right = ["tray" "mpd" "wireplumber" "network" "memory" "battery" "clock"];

      "hyprland/window" = {
        "max-length" = 80;
        "rewrite" = {
          "(.*) — Mozilla Firefox" = "󰈹 $1";
          "(.*) - fish" = "❯ $1";
        };
      };
      "tray" = {
        
      };
      "mpd" = {
        "format" = "{stateIcon} {elapsedTime:%M:%S} / {totalTime:%M:%S}";
        "max-length" = 40;
        "state-icons" = {
          "paused" = "󰏤";
          "playing" = "󰝚";
        };
      };
      "wireplumber" = {
        "format-muted" = "󰝟 Muted";
        "format-icons" = ["󰕿" "󰖀" "󰕾"];
        "format" = "{icon} {volume}%";
      };
      "network" = {
        "format-wifi" = "{icon} {signalStrength}% {essid}";
        "tooltip-format-wifi" = "{ipaddr} @ {ifname} ({frequency} GHz)";

        "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
      };
      "memory" = {
        format = " {}%";
      };
      "battery" = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        max-length = 25;
      };

      "clock" = {
        format = " {:%F %R}";
      };
    };
    style = ''
      * {
        font-family: monospace; 
      }
    '';

  };
}
