{ lib, ... }:
let
  domain = "muijsert.org";
  internalDomain = "internal.${domain}";
  acmeEmail = "rafael@${domain}";
in
{
  den.quirks.services = {
    description = "Service declarations";
  };

  den.ful.services.nginx.nixos = { config, services, ... }: {
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      virtualHosts = lib.listToAttrs (map (s: {  
        name = "${s.name}.${internalDomain}";  
        value = {  
          useACMEHost = internalDomain;
          forceSSL = true;  
          locations."/".proxyPass = "http://127.0.0.1:${builtins.toString s.port}";  
          extraConfig = ''
            allow 192.168.42.0/24;
            allow 192.168.100.0/24;
            deny all;
          '';
        };
      }) (lib.concatMap (s: s.internal or []) services));  
    };
    security.acme = {
      acceptTerms = true;
      defaults.email = acmeEmail;
      certs.${internalDomain} = {
        dnsProvider = "cloudflare";
        extraDomainNames = [ "*.${internalDomain}" ];
        group = config.services.nginx.group;
      };
    };
  };
}
