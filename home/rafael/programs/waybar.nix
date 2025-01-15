{
  programs.waybar = {
    settings = {
      mainBar = {
        height = 30;
        modules-left = ["hyprland/workspaces" "systemd-failed-units"];
        modules-center = ["hyprland/window"];
        modules-right = ["tray" "mpd" "wireplumber" "network" "memory" "battery" "clock"];
      };
    };
    style = ''
      * {
        font-family: monospace; 
      }
    '';
  };
}
