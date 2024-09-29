{
  config,
  lib,
  osConfig,
  ...
}: {
  programs.i3status-rust = {
    bars = {
      default = {
        blocks = [
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
              idle_bg = "#000000";
              good_bg = "#000000";
              warning_bg = "#000000";
              critical_bg = "#550000";
              info_bg = "#000000";
              separator_bg = "#000000";

              idle_fg = "#FFFFFF";
              good_fg = "#FFFFFF";
              warning_fg = "#FFFFFF";
              critical_fg = "#FFFFFF";
              info_fg = "#FFFFFF";
              separator_fg = "#FFFFFF";
            };
          };
        };
      };
    };
  };
}
