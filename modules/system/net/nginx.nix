{ __findFile, lib, ... }:
let
  domain = "muijsert.org";
  internalDomain = "internal.${domain}";
  acmeEmail = "rafael@${domain}";
in
{
  den.quirks.webServices = {
    description = "Web service declarations";
  };

  den.ful.services.nginx = {
    includes = [ <sops> ];
    nixos = { config, webServices, ... }: {
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
        }) (lib.concatMap (s: s.internal or []) webServices));  
      };
      security.acme = {
        acceptTerms = true;
        defaults.email = acmeEmail;
        certs.${internalDomain} = {
          credentialFiles.CLOUDFLARE_DNS_API_TOKEN_FILE = config.sops.secrets."cloudflare-dns-api-token".path;
          dnsProvider = "cloudflare";
          extraDomainNames = [ "*.${internalDomain}" ];
          group = config.services.nginx.group;
        };
      };
    };
  };
}
