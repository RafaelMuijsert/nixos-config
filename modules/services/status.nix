{ config, ... }:
let
  subdomain = "status";
  domain = "${subdomain}.${config.internal-domain}";
in
{
  den.aspects.services.status = {
    nixos = {
      services = {
        grafana = {
          enable = true;
          settings = {
            server = {
              http_addr = "127.0.0.1";
              http_port = 8401;
              enforce_domain = true;
              inherit domain;
            };
          };
        };
      };
    };
  };
}
