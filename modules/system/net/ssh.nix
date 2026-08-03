{
  den.ful.net.ssh = {
    nixos.services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    homeManager.programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "zero" = {
          hostname = "zero.internal";
          user = "rafael";
        }:
        "prox" = {
          hostname = "prox.internal";
          user = "rafael";
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
