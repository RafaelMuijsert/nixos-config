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
      fuzzel.enable = true;
      imv.enable = true;
      kitty.enable = true;
      mpv.enable = true;
      noctalia-shell.enable = true;
      rmpc.enable = true;
      thunderbird.enable = true;
      yt-dlp.enable = true;
      zathura.enable = true;
    };
    services = {
      mpd.enable = true;
      cliphist.enable = true;
      wlsunset.enable = true;
    };
  };
}
