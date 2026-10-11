  {
  den.ful.development.game = {
    homeManager = { pkgs, pkgs-unstable, ... }: {
      home.packages = [
        (pkgs.godot.override {
          withBuiltins = true;
        })
        pkgs.blender
      ];
    };
  };
}
