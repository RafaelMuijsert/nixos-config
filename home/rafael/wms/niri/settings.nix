{ config, inputs, lib, osConfig, pkgs, pkgs-unstable, ... }:
{
  config = lib.mkMerge [
    # https://github.com/sodiboo/niri-flake/issues/1492
    # Override the default to avoid evaluating niri when disabled
    { programs.niri.package = lib.mkDefault pkgs.emptyDirectory; }
    # { programs.niri.settings = lib.mkDefault null; }
    # { programs.niri.config = lib.mkDefault null; }
  
    (lib.mkIf osConfig.desktop.niri.enable {
      programs.niri.package = pkgs.niri;
      programs.niri.settings = {
          binds = {
            # Spawning programs
            "Alt+Space".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
            "Mod+I".action.spawn = "${pkgs.firefox}/bin/firefox";
            "Mod+Return".action.spawn = "${pkgs.kitty}/bin/kitty";

            # Navigation
            "Mod+H".action.focus-column-left = [];
            "Mod+J".action.focus-window-or-workspace-down = [];
            "Mod+K".action.focus-window-or-workspace-up = [];
            "Mod+L".action.focus-column-right = [];

            "Mod+Shift+H".action.move-column-left = [];
            "Mod+Shift+J".action.move-window-down-or-to-workspace-down = [];
            "Mod+Shift+K".action.move-window-up-or-to-workspace-up = [];
            "Mod+Shift+L".action.move-column-right = [];
        
            "Mod+Shift+Q".action.close-window = [];
            "Mod+F".action.maximize-column = [];
            "Mod+Shift+F".action.fullscreen-window = [];

            "Mod+Comma".action.consume-window-into-column = [];
            "Mod+Period".action.expel-window-from-column = [];
        
            "Mod+O" = {
              action.toggle-overview = [];
              repeat = false;
            };

            # System controls
            "Print".action.screenshot = [];
            "XF86AudioRaiseVolume".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "increase"];
            "XF86AudioLowerVolume".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "decrease"];
            "XF86AudioMute".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "muteOutput"];
            "XF86AudioMicMute".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "muteInput"];
            "XF86MonBrightnessUp".action.spawn = ["noctalia-shell" "ipc" "call" "brightness" "increase"];
            "XF86MonBrightnessDown".action.spawn = ["noctalia-shell" "ipc" "call" "brightness" "decrease"];
            "XF86Display".action.spawn-sh = "pkill wl-mirror || ${pkgs.wl-mirror}/bin/wl-present mirror eDP-1 -F";
            "Mod+V".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "clipboard"];
            "Mod+E".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "emoji"];
            "Mod+C".action.spawn = ["noctalia-shell" "ipc" "call" "controlCenter" "toggle"];


            "Mod+T".action.spawn = ["${pkgs.kitty}/bin/kitty" "hx" "~/Documents/Personal/Notes/todo.txt"];
            "Mod+Shift+T".action.spawn = ["${pkgs.kitty}/bin/kitty" "hx" "~/Documents/Personal/Notes/backlog.txt"];
            "Mod+W".action.spawn = ["${pkgs.kitty}/bin/kitty" "hx" "~/Documents/Personal/Notes/weekly.txt"];

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
            power-key-handling.enable = false;
          };
          layout = {
            preset-column-widths = [
              { proportion = 1. / 2.; }
            ];
            border = {
              enable = true;
              width = 2;
            };
            always-center-single-column = true;
            center-focused-column = "on-overflow";
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

          # Lock screen on lid close
          switch-events = {
            lid-close.action.spawn = ["noctalia-shell" "ipc" "call" "lockScreen" "lock"];
          };

          screenshot-path = "~/Pictures/Screenshots/%s.png";
          prefer-no-csd = true;
      };
    })
  ];
}

