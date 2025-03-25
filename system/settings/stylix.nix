{
  config,
  lib,
  pkgs,
  ...
}: {
  stylix = {
    base16Scheme = "${config.desktop.theme.scheme}";
    polarity = "${config.desktop.theme.polarity}";
    image = config.desktop.theme.wallpaper;
    cursor = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 24;
    };
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
        package = lib.mkDefault (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];});
        name = lib.mkDefault ("JetBrainsMono Nerd Font Mono");
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes.popups = 12;
      sizes.desktop = 12;
    };
  };
}
