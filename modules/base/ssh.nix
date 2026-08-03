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
          hostname = "zero.internal";
          user = "rafael";
        };
        "prox" = {
          hostname = "prox.internal";
          user = "root";
        };
        "infra" = {
          hostname = "infra.internal";
          user = "rafael";
        };
        "core" = {
          hostname = "core.internal";
          user = "rafael";
        };
      };
    };
  };
}
