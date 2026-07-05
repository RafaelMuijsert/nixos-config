{
  den.ful.wms.niri.homeManager = { pkgs, ... }: {
    programs.niri.settings.binds = {
      # Spawning programs
      "Alt+Space".action.spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
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
      "XF86AudioRaiseVolume".action.spawn = ["noctalia" "msg" "volume-up"];
      "XF86AudioLowerVolume".action.spawn = ["noctalia" "msg" "volume-down"];
      "XF86AudioMute".action.spawn = ["noctalia" "msg" "volume-mute"];
      "XF86AudioMicMute".action.spawn = ["noctalia" "msg" "mic-mute"];
      "XF86MonBrightnessUp".action.spawn = ["noctalia" "msg" "brightness-up"];
      "XF86MonBrightnessDown".action.spawn = ["noctalia" "msg" "brightness-down"];
      "XF86Display".action.spawn-sh = "pkill wl-mirror || ${pkgs.wl-mirror}/bin/wl-present mirror eDP-1 -F";
      "Mod+V".action.spawn = ["noctalia" "msg" "panel-toggle" "clipboard"];
      "Mod+E".action.spawn = ["noctalia" "msg" "panel-toggle" "launcher" "/emo"];
      "Mod+C".action.spawn = ["noctalia" "msg" "panel-toggle" "control-center"];

      "Mod+T".action.spawn = ["${pkgs.kitty}/bin/kitty" "hx" "~/Documents/Personal/Notes/todo.txt"];
      "Mod+Shift+T".action.spawn = ["${pkgs.kitty}/bin/kitty" "hx" "~/Documents/Personal/Notes/backlog.txt"];
      "Mod+W".action.spawn = ["${pkgs.kitty}/bin/kitty" "hx" "~/Documents/Personal/Notes/weekly.txt"];

      # Exit Niri
      "Mod+Shift+E".action.quit.skip-confirmation = true;
    };
  };
}
