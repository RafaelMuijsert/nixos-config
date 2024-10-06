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
      imv.enable = true;
      fuzzel.enable = true;
      mpv.enable = true;
      kitty.enable = true;
      thunderbird.enable = true;
      yt-dlp.enable = true;
    };
    services = {
      mako.enable = true;
    };
    wayland.windowManager.sway.enable = true;
  };
}
