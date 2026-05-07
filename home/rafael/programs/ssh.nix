{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "zero" = {
        hostname = "192.168.42.2";
        user = "rafael";
      };
      "one" = {
        hostname = "192.168.42.3";
        user = "rafael";
      };
      "snellius" = {
        hostname = "snellius.surf.nl";
        forwardAgent = true;
        user = "rmuijsert";
        extraOptions = {
          WarnWeakCrypto = "no";
        };
      };
    };
  };
}
