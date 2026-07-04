{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.desktop.hyprland.enable {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
    programs = {
      firefox.enable = true;
      hyprlock.enable = true;
      waybar.enable = true;
      imv.enable = true;
      fuzzel.enable = true;
      mpv.enable = true;
      kitty.enable = true;
      thunderbird.enable = true;
      yt-dlp.enable = true;
      zathura.enable = true;
    };
    services = {
      mako.enable = true;
      mpd.enable = true;
      cliphist.enable = true;
    };
    wayland.windowManager.hyprland.enable = true;
  };
}
