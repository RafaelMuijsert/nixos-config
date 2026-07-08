# Nginx reverse proxy with ACME (Let's Encrypt) SSL certificates.
# All recommended hardening settings are enabled: TLS 1.3, HSTS,
# gzip compression, and optimized proxy settings.
let
  acmeEmail = "rafael@muijsert.org";
in
{
  den.ful.services.nginx.nixos = {
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
    };
    security.acme = {
      acceptTerms = true;
      defaults.email = acmeEmail;
    };
  };
  den.aspects.one.nixos.networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
