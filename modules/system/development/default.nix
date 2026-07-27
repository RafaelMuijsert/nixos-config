{
  den.ful.development.base = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        devenv
      ];
    };
  };
}
