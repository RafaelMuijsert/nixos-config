{
  den.ful.development.game = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        (pkgs.godot.override {
          withBuiltins = true;
        })
        pkgs.blender
      ];
    };
  };
}
