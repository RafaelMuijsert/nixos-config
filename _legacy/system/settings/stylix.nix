{
  config,
  lib,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
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
        package = pkgs.nerd-fonts.arimo;
        name = "Arimo Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.arimo;
        name = "Arimo Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = lib.mkDefault "JetBrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes.popups = 12;
      sizes.desktop = 12;
    };
  };
}
