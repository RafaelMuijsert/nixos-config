{
  pkgs-unstable,
  ...
}: {
  programs.waybar = {
    settings.mainBar = {
      height = 30;
      modules-left = ["hyprland/workspaces" "systemd-failed-units"];
      modules-center = ["hyprland/window"];
      modules-right = ["tray" "mpd" "wireplumber" "network" "memory" "battery" "clock"];

      "systemd-failed-units" = {
        "format" = " {nr_failed} failed";
        "format-ok" = "";
        "hide-on-ok" = false;
      };

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
        "tooltip-format" = "{artist} - {title}";
        "on-click" = "${pkgs-unstable.rmpc}/bin/rmpc togglepause";
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
          full = 100;
          normal = 80;
          warning = 25;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
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
      .modules-right * {
        margin-left: 16px;
      }

      #workspaces button {
        color: @base05;
      }

      #workspaces {
        margin-right: 16px;
      }

      #systemd-failed-units.ok {
        color: @base0B;
      }

      #systemd-failed-units.degraded {
        color: @base08;
      }

      #window {
        color: @base07;
      }

      #mpd {
        color: @base0A;
      }

      #wireplumber {
        color: @base0B;
      }

      #network.wifi {
        color: @base0C;
      }

      #network.disconnected {
        color: @base08;
      }

      #memory {
        color: @base0D;
      }

      #battery.full {
        color: @base0B;
      }

      #battery.normal, #battery {
        color: @base05;
      }

      #battery.warning {
        color: @base09;
      }

      #battery.critical {
        color: @base08;
      }

      #clock{
        color: @base0E;
      }
    '';
  };
}
