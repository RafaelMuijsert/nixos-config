{
  den.aspects.academia.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      telegram-desktop  
    ];
  };
}
