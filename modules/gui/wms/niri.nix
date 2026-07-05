{ __findFile, inputs, ... }:
{
  flake-file.inputs = {
    niri-flake.url = "github:sodiboo/niri-flake";
    niri-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.ful.wms.niri = {
    includes = [
      inputs.niri-flake.nixosModules.niri
    ];
    nixos = {
      programs.niri = {
        enable = true;
      };
    };
    homeManager = {
      programs.niri = {
        enable = true;
      };
    };
  };
}
