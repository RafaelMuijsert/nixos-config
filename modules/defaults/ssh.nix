{
  den.default = {
    nixos = {
      services.openssh = {
        hostKeys = [
          {
            type = "ed25519";
            path = "/etc/ssh/ssh_host_ed25519_key";
          }
        ];
      };
    };
    homeManager.programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "zero" = {
          forwardagent = true;
          hostname = "zero.internal";
          user = "rafael";
        };
        "prox" = {
          forwardagent = true;
          hostname = "prox.internal";
          user = "root";
        };
        "infra" = {
          forwardagent = true;
          hostname = "infra.internal";
          user = "rafael";
        };
        "core" = {
          forwardagent = true;
          hostname = "core.internal";
          user = "rafael";
        };
      };
    };
  };
}
