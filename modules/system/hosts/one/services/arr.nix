{
  den.ful.services.arr = {
    nixos = {
      services = {
        radarr = {
          enable = true;
          openFirewall = true;
        };
        sonarr = {
          enable = true;
          openFirewall = true;
        };
        prowlarr = {
          enable = true;
          openFirewall = true;
        };
      };
    };
  };
}
