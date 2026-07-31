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
        prometheus = {
          enable = true;
          exporters.node = {
            enable = true;
            port = 9100;
            enabledCollectors = [
              "logind"
              "systemd"
            ];
          };
          scrapeConfigs = [
            {
              job_name = "node";
              static_configs = [
                {
                  targets = [
                    "localhost:${toString config.services.prometheus.exporters.node.port}"
                  ];
                }
              ];
            }
          ];
        };
      };
    };
  };
}
