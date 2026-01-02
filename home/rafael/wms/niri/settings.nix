{ pkgs, pkgs-unstable, ... }:
{
  programs.niri = {
    settings = {
      binds = {
        # Spawning programs
        "Alt+Space".action.spawn = "${pkgs-unstable.fuzzel}/bin/fuzzel";
        "Mod+I".action.spawn = "${pkgs.firefox}/bin/firefox";
        "Mod+Return".action.spawn = "${pkgs.kitty}/bin/kitty";

        # Navigation
        "Mod+H".action.focus-column-left = [];
        "Mod+J".action.focus-window-or-workspace-down = [];
        "Mod+K".action.focus-window-or-workspace-up = [];
        "Mod+L".action.focus-column-right = [];
        "Mod+Shift+Q".action.close-window = [];
        "Mod+O" = {
          action.toggle-overview = [];
          repeat = false;
        };

        # Misc
        "Print".action.screenshot-screen = [];

        # Exit Niri
        "Mod+Shift+E".action.quit.skip-confirmation = true;
      };
      input = {
        keyboard = {
          xkb = {
            options = "caps:swapescape,grp:shifts_toggle";
            layout = "us,us";
            variant = ",intl";
          };
          repeat-delay = 200;
          repeat-rate = 30;
        };
      };
      layout = {
        preset-column-widths = [
          { proportion = 1. / 2.; }
        ];
        always-center-single-column = true;
        default-column-width = { proportion = 1. / 2.; };
      };
      outputs = {
        "HDMI-A-3" = {
          scale = 1;
        };
        "eDP-1" = {
          scale = 1;
        };
      };

      screenshot-path = "~/Pictures/Screenshots/%s.png";
      prefer-no-csd = true;
    };
  };
}
