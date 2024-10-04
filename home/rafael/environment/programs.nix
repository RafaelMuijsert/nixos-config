{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf osConfig.desktop.i3-minimal.enable {
      home.sessionVariables = {
        TERMINAL = "kitty";
        BROWSER = "firefox";
        LAUNCHER = "rofi -show-icons -show drun";
      };
    })
    (lib.mkIf osConfig.desktop.sway-minimal.enable {
      home.sessionVariables = {
        TERMINAL = "kitty";
        BROWSER = "firefox";
        LAUNCHER = "wofi -show-icons -show drun";
      };
    })
  ];
}
