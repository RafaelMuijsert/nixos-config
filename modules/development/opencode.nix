{
  den.ful.development.opencode.homeManager = { pkgs-unstable, ... }: {
    programs.opencode = {
      enable = true;
      package = pkgs-unstable.opencode;
    };
  };
}
