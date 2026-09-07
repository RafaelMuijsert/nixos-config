{
  den.default.homeManager = { pkgs, pkgs-unstable, ... }: {
    home.packages = [
      (pkgs.python3.withPackages (ppkgs: [
        ppkgs.jupyter
      ]))
      pkgs-unstable.uv
    ];
  };
}
