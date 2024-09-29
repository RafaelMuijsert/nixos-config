{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    home.sessionVariables = {
      TERMINAL = "kitty";
      BROWSER = "firefox";
      LAUNCHER = "rofi -show-icons -show drun";
    };
  };
}
