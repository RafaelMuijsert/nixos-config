let
  mediaGroup = "media";
in
{
  den.ful.services.arr = {
    nixos = {
      # Downloads directory must be writable by both qBittorrent and *arr to create hard links
      users.groups.${mediaGroup} = { };
      services = {
        bazarr = {
          enable = true;
          openFirewall = true;
          group = mediaGroup;
        };
        radarr = {
          enable = true;
          openFirewall = true;
          group = mediaGroup;
        };
        sonarr = {
          enable = true;
          openFirewall = true;
          group = mediaGroup;
        };
        prowlarr = {
          enable = true;
          openFirewall = true;
        };
        qbittorrent = {
          enable = true;
          openFirewall = true;
          group = mediaGroup;
        };
      };
    };
  };
}
