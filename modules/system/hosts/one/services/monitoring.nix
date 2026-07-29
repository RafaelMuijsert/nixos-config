{
  den.ful.services.monitoring = {
    nixos = {
      services = {
        grafana = {
          enable = true;
          openFirewall = true;
        };
      };
    };
  };
}
