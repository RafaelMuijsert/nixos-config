{
  pkgs,
  pkgs-unstable,
  ...
}: {
  wayland.windowManager.hyprland.settings.env = [
    "TERMINAL,${pkgs.kitty}/bin/kitty"
    "BROWSER,${pkgs.firefox}/bin/firefox"
    "LAUNCHER,${pkgs-unstable.fuzzel}/bin/fuzzel"
  ];
}
