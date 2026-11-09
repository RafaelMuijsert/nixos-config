let
  port = 8686;
  group = "media";
in
{
  den.aspects.services.lidarr = {
    webServices.internal.lidarr.port = port;
    nixos.services.lidarr = {
      enable = true;
      inherit group;
    };
  };
}
