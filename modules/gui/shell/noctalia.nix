{
  inputs,
  ...
}: {
  flake-file.inputs = {
    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.ful.shell.noctalia.homeManager = { pkgs, ... }: {
    imports = [ inputs.noctalia.homeModules.default ];
    programs.noctalia = {
      enable = true;
      settings = {
        bar.default = {
          end = [
              "tray"
              "notifications"
              "clipboard"
              "network"
              "bluetooth"
              "volume"
              "brightness"
              "battery"
              "control-center"
              "session"
          ];
          font_family = "JetBrainsMono NFM";
          font_weight = 400;
          margin_edge = 0;
          margin_ends = 0;
          position = "bottom";
          radius = 0;
          shadow = false;
          start = [ "workspaces" ];
          thickness = 32;
        };
        control_center = {
          hidden_tabs = [ "calendar" ];
        };

        desktop_widgets = {
          schema_version = 2;
          widget_order = [];
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          widget = {};
        };

        idle = {
          behavior_order = [ "idle-behavior" "idle-behavior-3" ];

          behavior = {
            idle-behavior = {
              action = "screen_off";
              enabled = false;
              timeout = 300.0;
            };

            idle-behavior-3 = {
              action = "lock_and_suspend";
              enabled = false;
              timeout = 360.0;
            };
          };
        };

        location.address = "Amsterdam, Netherlands";

        lockscreen_widgets = {
          enabled = false;
          schema_version = 2;
          widget_order = [ "lockscreen-login-box@HDMI-A-3" ];
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          widget."lockscreen-login-box@HDMI-A-3" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 1920.0;
            cy = 2041.0;
            output = "HDMI-A-3";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_password_hint = true;
            };
          };
        };
        nightlight = {
          enabled = true;
          temperature_night = 2500;
        };
        shell = {
          # avatar_path = inputs.self + "/icons/profile.png";
          screen_time_enabled = true;
          ui_scale = 1.5;
          panel.open_near_click_control_center = true;
          screenshot = {
            directory = "/home/rafael/Pictures/Screenshots";
            filename_pattern = "%s.png";
          };
        };
        theme = {
          builtin = "Catppuccin";
          community_palette = "Oxocarbon";
          source = "builtin";
          wallpaper_scheme = "m3-content";
        };
        # wallpaper = {
        #   default.path = config.stylix.image;
        # };
      };
    };
  };
}
