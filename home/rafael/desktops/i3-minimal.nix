{ config, lib, osConfig, ... }:
{
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs = {
      firefox.enable = true;
      feh.enable = true;
      i3status-rust.enable = true;
      rofi.enable = true;
      mpv.enable = true;
      kitty.enable = true;
      thunderbird.enable = true;
      yt-dlp.enable = true;
    };
    xsession.windowManager.i3.enable = true;
  };
}
