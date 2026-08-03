let
  port = 8686;
  group = "media";
in {
  den.ful.services.lidarr= {
    webServices.internal = [
      {
        name = "lidarr";
        inherit port;
      }
    ];
    nixos.services.lidarr = {
      enable = true;
      inherit group;
    };
  };
}
