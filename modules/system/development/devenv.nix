{
  den.ful.development.devenv.homeManager = { pkgs, pkgs-unstable, ... }: {
    home.packages = with pkgs; [
      devenv
    ];
    programs.fish.interactiveShellInit = "devenv hook fish | source";
  };
}
