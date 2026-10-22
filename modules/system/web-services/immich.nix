{ config, ... }:
let
  port = 4821;
  subdomain = "photos";
in
{
  den.ful.services.immich = {
    webServices.external.${subdomain}.port = port;
    nixos = { pkgs-unstable, ... }: {
      services.immich = {
        enable = true;
        mediaLocation = "${config.media-drive}/Photos";
        package = pkgs-unstable.immich;
        host = "127.0.0.1";
        inherit port;
        settings.server.externalDomain = "https://${subdomain}.${config.domain}";
        machine-learning.enable = true;
      };
      # Required for larger files
      services.nginx.clientMaxBodySize = "10G";
    };
  };
}
