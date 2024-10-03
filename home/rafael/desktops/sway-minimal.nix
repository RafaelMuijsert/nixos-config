{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.desktop.sway-minimal.enable {
    programs = {
      firefox.enable = true;
      i3status-rust.enable = true;
      wofi.enable = true;
      mpv.enable = true;
      kitty.enable = true;
      thunderbird.enable = true;
      yt-dlp.enable = true;
    };
    wayland.windowManager.sway.enable = true;
    gtk.enable = true;
  };
}
