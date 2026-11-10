{ config, ... }:
let
  port = 28981;
  subdomain = "docs";
  domain = "${subdomain}.${config.internal-domain}";
in
{
  den.aspects.services.paperless = {
    webServices.internal.${subdomain}.port = port;
    nixos = cfg: {
      services.paperless = {
        inherit domain;
        enable = true;
        environmentFile = cfg.config.sops.secrets."paperless-secret".path;
        passwordFile = cfg.config.sops.secrets."paperless-password".path;
        inherit port;
      };
    };
  };
}
