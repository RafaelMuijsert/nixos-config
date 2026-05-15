let
  acmeEmail       = "rafael@muijsert.org";
in {
  # TLS / ACME 
  security.acme = {
    acceptTerms      = true;
    defaults.email   = acmeEmail;
  };

  # Nginx reverse proxy 
  services.nginx = {
    enable                  = true;
    recommendedProxySettings = true;
    recommendedTlsSettings   = true;
    recommendedOptimisation  = true;
    recommendedGzipSettings  = true;
  };

  # Firewall config
  networking.firewall.allowedTCPPorts = [ 443 ];
}
