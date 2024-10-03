{ config, ... }:
{
  stylix = {
    enable = true;

    base16Scheme = "${config.desktop.theme.scheme}";
    polarity = "${config.desktop.theme.polarity}";
    image = config.desktop.theme.wallpaper;
  };
}
