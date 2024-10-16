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
      serif = {
        package = pkgs.nerdfonts.override {fonts = ["Arimo"];};
        name = "Arimo Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerdfonts.override {fonts = ["Arimo"];};
        name = "Arimo Nerd Font";
      };

      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes.popups = 14;
    };
  };
}
