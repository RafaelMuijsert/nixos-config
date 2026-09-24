{ __findFile, lib, ... }:
let
  domain = "muijsert.org";
  internalDomain = "internal.${domain}";
  internalSubnets = [ "192.168.42.0/24" "192.168.100.0/24" ];
  acmeEmail = "rafael@${domain}";
in
{
  den.quirks.webServices = {
    description = "Web service declarations";
  };

  den.ful.services.nginx = {
    includes = [ <sops> ];
    nixos = { config, webServices, ... }:
    let
      internalServices = lib.concatMap (  
        w: lib.mapAttrsToList (name: v: v // { inherit name; }) (w.internal or { })  
      ) webServices;

      externalServices = lib.concatMap (  
        w: lib.mapAttrsToList (name: v: v // { inherit name; }) (w.external or { })  
      ) webServices;
    in
    {
      networking.firewall.allowedTCPPorts = [ 80 443 ];
      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
        recommendedOptimisation = true;
        recommendedGzipSettings = true;
        virtualHosts =
          (lib.listToAttrs (
            map (s: {
              name = "${s.name}.${internalDomain}";
              value = {
                useACMEHost = internalDomain;
                forceSSL = true;
                locations."/".proxyPass = "http://127.0.0.1:${toString s.port}";
                extraConfig =
                  (lib.concatMapStrings (subnet: "allow ${subnet};\n") internalSubnets)
                  + "deny all;";
              };
            }) internalServices
          ))
          // (lib.listToAttrs (
            map (s: {
              name = "${s.name}.${domain}";
              value = {
                enableACME = true;
                forceSSL = true;
                locations."/".proxyPass = "http://127.0.0.1:${toString s.port}";
              };
            }) externalServices
          ));
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
