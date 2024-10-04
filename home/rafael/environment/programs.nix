{
  config,
  lib,
  osConfig,
  pkgs,
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
        LAUNCHER = "${pkgs.fuzzel}/bin/fuzzel";
      };
    })
  ];
}
