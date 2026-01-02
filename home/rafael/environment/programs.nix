{
  config,
  lib,
  osConfig,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf osConfig.desktop.i3-minimal.enable {
      home.sessionVariables = {
        TERMINAL = "${pkgs.kitty}/bin/kitty";
        BROWSER = "${pkgs.firefox}/bin/firefox";
        LAUNCHER = "${pkgs.rofi}/bin/rofi -show-icons -show drun";
      };
    })
    (lib.mkIf osConfig.desktop.sway-minimal.enable {
      home.sessionVariables = {
        TERMINAL = "${pkgs.kitty}/bin/kitty";
        BROWSER = "${pkgs.firefox}/bin/firefox";
        LAUNCHER = "${pkgs-unstable.fuzzel}/bin/fuzzel";
      };
    })
    (lib.mkIf osConfig.desktop.niri.enable {
      home.sessionVariables = {
        TERMINAL = "${pkgs.kitty}/bin/kitty";
        BROWSER = "${pkgs.firefox}/bin/firefox";
        LAUNCHER = "${pkgs-unstable.fuzzel}/bin/fuzzel";
      };
    })
  ];
}
