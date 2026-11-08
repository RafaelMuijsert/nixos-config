{ den, ... }:
{
  den.ful.theme.catppuccin = {
    includes = [ den.aspects.stylix ];
    host.class.theme = {
      scheme = ./scheme.yaml;
      polarity = "dark";
      wallpaper = ./wallpaper.png;
    };
  };
}
