{ den, config, ... }:
let
  subdomain = "status";
  domain = "${subdomain}.${config.internal-domain}";
  port = 8401;
in
{
  den.aspects.services.status = {
    includes = [ den.aspects.sops ];
    webServices.internal.${subdomain} = {
      host = config.infra-hostname;
      port = port;
    };
    nixos = cfg: {
      sops.secrets.grafana-secret-key.owner = "grafana";
      services = {
        grafana = {
          enable = true;
          settings = {
            security.secret_key = "$__file{${cfg.config.sops.secrets.grafana-secret-key.path}}";
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
