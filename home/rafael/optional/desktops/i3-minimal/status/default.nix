{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs.i3status-rust = {
      enable = true;
      bars = {
        default = {
          blocks = [
            {
              block = "net";
              format = " $icon {$signal_strength $ssid|Wired connection} ";
            }
            (lib.mkIf osConfig.desktop.i3-minimal.isLaptop {
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
  };
}
