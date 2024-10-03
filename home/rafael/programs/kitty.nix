{
  lib,
  osConfig,
  ...
}: let
  theme = osConfig.desktop.theme;
  toHex = color: "#" + color;
in {
  programs.kitty = {
    shellIntegration.enableFishIntegration = true;
  };
}
