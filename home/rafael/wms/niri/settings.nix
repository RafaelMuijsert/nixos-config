{ lib, pkgs, pkgs-unstable, ... }:
{
  programs.niri= {
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

        # Exit Niri
        "Mod+Shift+E".action.quit.skip-confirmation = true;
      };
      layout = {
        preset-column-widths = [
          { proportion = 1. / 2.; }
        ];
        default-column-width = { proportion = 1. / 2.; };
      };
      outputs = {
        "HDMI-A-3" = {
          scale = 1;
        };
        "eDP-1" = {
          scale = 1;
        };
      }; prefer-no-csd = true;
    };
  };
}
