{ config, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = config.desktop.theme.wallpaper;
  };
}
