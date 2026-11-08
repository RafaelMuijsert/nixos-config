{
  den.ful.development.cxx.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      clang
      clang-tools
      cmake
      gnumake
    ];
  };
}
