{
  den.ful.image.imv.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      imv
    ];
  };
}
