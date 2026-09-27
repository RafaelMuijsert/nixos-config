{ config, ... }:
let
  port = 28981;
  subdomain = "docs";
in
{
  den.ful.services.paperless = {
    webServices.internal.${subdomain}.port = port;
    nixos = { ... } @ cfg: {
      services.paperless = {
        domain = "${subdomain}.internal.${config.domain}";
        enable = true;
        environmentFile = cfg.config.sops.secrets."paperless-secret".path;
        passwordFile = cfg.config.sops.secrets."paperless-password".path;
        inherit port;
      };
    };
  };
}
