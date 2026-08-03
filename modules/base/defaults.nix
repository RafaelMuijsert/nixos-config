{ inputs, lib, ... }:
{
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  den = {
    default = {
      nixos.system.stateVersion = "26.05";
      homeManager.home.stateVersion = "26.05";
    };
    schema = {
      host.includes = [
        ({ host, ... }: {
          nixos._module.args.pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${host.system};
        })
      ];

      user = {
        classes = lib.mkDefault [ "homeManager" ];
        includes = [
          ({ host, ... }: {
            homeManager._module.args.pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${host.system};
          })
        ];
        };
    };
  };


}
