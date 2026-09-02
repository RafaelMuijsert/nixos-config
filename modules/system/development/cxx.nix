{
  den.ful.development.cxx.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      cmake
      gnumake
      gcc
    ];
  };
}
