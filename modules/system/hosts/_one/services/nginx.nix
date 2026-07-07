# Nginx reverse proxy with ACME (Let's Encrypt) SSL certificates.
# All recommended hardening settings are enabled: TLS 1.3, HSTS,
# gzip compression, and optimized proxy settings.
let
  acmeEmail = "rafael@muijsert.org";
in
{
  security.acme = {
    acceptTerms = true;
    defaults.email = acmeEmail;
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
  };

  # Open HTTP (80) and HTTPS (443) for ACME challenges and traffic
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
