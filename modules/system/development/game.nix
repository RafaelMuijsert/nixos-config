{
  den.ful.development.game = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        godot
      ];
    };
  };
}
