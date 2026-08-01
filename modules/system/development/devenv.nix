{
  den.ful.development.devenv.homeManager = { pkgs, pkgs-unstable, ... }: {
    home.packages = [ pkgs-unstable.devenv ];
    programs.fish.interactiveShellInit = "devenv hook fish | source";
  };
}
