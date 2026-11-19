{ config, ... }:
let
  subdomain = "status";
  domain = "${subdomain}.${config.internal-domain}";
  port = 8401;
in
{
  den.aspects.services.status = {
    webServices.internal.${subdomain}.port = port;
    nixos = {
      services = {
        grafana = {
          enable = true;
          settings = {
            server = {
              http_addr = "127.0.0.1";
              http_port = port;
              enforce_domain = true;
              inherit domain;
            };
          };
        };
      };
    };
  };
}
