{pkgs-unstable, ...}: let
  immichPort = 4821;
  immichDomain = "photos.muijsert.org";
in {
  # Immich
  services.immich = {
    enable = true;
    mediaLocation = "/mnt/data/Photos/";
    package = pkgs-unstable.immich;
    host = "127.0.0.1";
    port = immichPort;
    settings.server.externalDomain = "https://${immichDomain}";
  };

  services.nginx = {
    # Required for larger files
    clientMaxBodySize = "10G";

    virtualHosts."${immichDomain}" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${builtins.toString immichPort}";
        proxyWebsockets = true;
      };
    };
  };
}
