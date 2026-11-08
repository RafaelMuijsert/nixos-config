{ __findFile, inputs, ... }:
{
  flake-file.inputs = {
    niri-flake.url = "github:sodiboo/niri-flake";
    niri-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.ful.wm.niri = {
    nixos = {
      programs.niri = {
        enable = true;
      };
    };
    homeManager = { lib, pkgs, ... }: {
      imports = [ inputs.niri-flake.homeModules.niri ];
      programs.niri = {
        enable = true;
        settings = {
          screenshot-path = "~/Pictures/Screenshots/%s.png";
          hotkey-overlay.skip-at-startup = true;
          prefer-no-csd = true;
          xwayland-satellite = {
            enable = true;
            path = lib.getExe pkgs.xwayland-satellite;
          };
        };
      };
    };
  };
}
