{
  den.ful.development.opencode.homeManager = { pkgs, pkgs-unstable, ... }: {
    programs.opencode = {
      enable = true;
      package = pkgs-unstable.opencode;
    };
  };
}
