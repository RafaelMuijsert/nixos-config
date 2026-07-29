{
  den.ful.services.monitoring = {
    nixos = { config, ... }: {
      services = {
        grafana = {
          enable = true;
          openFirewall = true;
          settings = {
            server.http_addr = "0.0.0.0";
            security.secret_key = "$__file{${config.sops.secrets.grafana-secret-key.path}}";
          };
        };
      };
    };
  };
}
