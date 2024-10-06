{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  background = config.lib.stylix.colors.base01;
  foreground = config.lib.stylix.colors.base05;
  sbRecordingStatus = pkgs.writeShellApplication {
    name = "sb-recording-status";
    text = ''
      #!/bin/sh
      if pidof wf-recorder > /dev/null; then
        echo '{"text": " Recording", "state": "critical"}';
      else
        echo '{"text": ""}';
      fi
    '';
  };
in {
  programs.i3status-rust = {
    bars = {
      default = {
        blocks = [
          {
            block = "custom";
            command = "${sbRecordingStatus}/bin/sb-recording-status";
            hide_when_empty = true;
            interval = "once";
            signal = 4;
            json = true;
            click = [
              {
                button = "left";
                cmd = "pkill --signal INT wf-recorder && pkill -SIGRTMIN+4 i3status-rs";
              }
            ];
          }
          {
            block = "sound";
            format = " $icon {$volume|Muted} ";
            step_width = 1;
            max_vol = 100;
            headphones_indicator = true;
          }
          {
            block = "net";
            format = " $icon {$signal_strength $ssid|Wired connection} ";
          }
          (lib.mkIf osConfig.isLaptop {
            block = "battery";
            format = " $icon $percentage ";
          })
          {
            block = "time";
            format = "  $timestamp.datetime(f:'%F %R') ";
            interval = 60;
          }
        ];
        icons = "material-nf";
        settings = {
          theme = {
            overrides = {
              idle_bg = "#${background}";
              good_bg = "#${background}";
              warning_bg = "#${background}";
              critical_bg = "#550000";
              info_bg = "#${background}";
              separator_bg = "#${background}";

              idle_fg = "#${foreground}";
              good_fg = "#${foreground}";
              warning_fg = "#${foreground}";
              critical_fg = "#${foreground}";
              info_fg = "#${foreground}";
              separator_fg = "#${foreground}";
            };
          };
        };
      };
    };
  };
}
