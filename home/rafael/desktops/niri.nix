{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.desktop.niri.enable {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
    programs = {
      firefox.enable = true;
      hyprlock.enable = true;
      i3status-rust.enable = true;
      imv.enable = true;
      fuzzel.enable = true;
      mpv.enable = true;
      noctalia-shell.enable = true;
      kitty.enable = true;
      thunderbird.enable = true;
      yt-dlp.enable = true;
      zathura.enable = true;
    };
    services = {
      mako.enable = true;
      mpd.enable = true;
      cliphist.enable = true;
      wlsunset.enable = true;
    };
  };
}
