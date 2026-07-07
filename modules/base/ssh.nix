{
  den.default.nixos = {
    services.openssh = {
      hostKeys = [
        {
          type = "ed25519";
          path = "/etc/ssh/ssh_host_ed25519_key";
        }
      ];
    };
  };
  den.aspects.rafael.homeManager.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "zero" = {
        hostname = "192.168.42.2";
        user = "rafael";
      };
      "one" = {
        hostname = "192.168.42.3";
        user = "rafael";
      };
    };
  };
}
