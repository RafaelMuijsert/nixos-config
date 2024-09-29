{
  lib,
  osConfig,
  ...
}: let
  theme = osConfig.desktop.theme;
  toHex = color: "#" + color;
in {
  programs.kitty = {
    font.name = "CaskaydiaCove Nerd Font Mono";
    font.size = 14;
    shellIntegration.enableFishIntegration = true;

    settings = {
      background = toHex theme.base00;
      foreground = toHex theme.base07;
      selection_background = toHex theme.base07;
      selection_foreground = toHex theme.base00;
      # Normal
      color0 = toHex theme.base00;
      color1 = toHex theme.base01;
      color2 = toHex theme.base02;
      color3 = toHex theme.base03;
      color4 = toHex theme.base04;
      color5 = toHex theme.base05;
      color6 = toHex theme.base06;
      color7 = toHex theme.base07;

      # Bright
      color8 = toHex theme.base08;
      color9 = toHex theme.base09;
      color10 = toHex theme.base0A;
      color11 = toHex theme.base0B;
      color12 = toHex theme.base0C;
      color13 = toHex theme.base0D;
      color14 = toHex theme.base0E;
      color15 = toHex theme.base0F;
    };
  };
}
