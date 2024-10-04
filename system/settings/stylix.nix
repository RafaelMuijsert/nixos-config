{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;

    base16Scheme = "${config.desktop.theme.scheme}";
    polarity = "${config.desktop.theme.polarity}";
    image = config.desktop.theme.wallpaper;
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["CascadiaCode"];};
        name = "CaskaydiaCove Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes.desktop = 12;
      sizes.popups = 12;
    };
  };
}
