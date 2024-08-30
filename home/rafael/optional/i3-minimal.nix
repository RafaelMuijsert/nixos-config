{
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs = {
      kitty.enable = true;
      firefox.enable = true;
      rofi.enable = true;
    };

    # Enable GTK to ensure applications use dark theme.
    gtk.enable = true;

    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        window = {
          border = 1;
          titlebar = false;
        };
        fonts = {
          names = [ "CaskaydiaCove Nerd Font Mono" ];
          size = 12.0;
        };
        colors = {
          focused = {
            background = "#000000";
            border = "#484848";
            childBorder = "#484848";
            indicator = "#484848";
            text = "#ffffff";
          };
          unfocused = {
            background = "#000000";
            border = "#000000";
            childBorder = "#000000";
            indicator = "#000000";
            text = "#ffffff";
          };
        };
        bars = [
          {
            position = "top";
            statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
            fonts = {
              names = [ "CaskaydiaCove Nerd Font Mono" ];
              size = 12.0;
            };
            colors = {
              focusedWorkspace = {
                background = "#484848";
                border = "#484848";
                text = "#ffffff";
              };
              inactiveWorkspace = {
                background = "#000000";
                border = "#000000";
                text = "#ffffff";
              };
            };
          }
        ];
      };
    };
    programs.i3status-rust = {
      enable = true;
      bars = {
        default = {
          blocks = [
            {
              block = "battery";
              format = " $icon $percentage ";
            }
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


    home.sessionVariables = {
      TERMINAL = "kitty";
      BROWSER = "firefox";
      LAUNCHER = "rofi -show-icons -show drun";
    };
  };
}
