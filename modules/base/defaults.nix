{ lib, ... }:
{
  # Pinned flake inputs managed through flake-file's declarative input system.
  # All inputs must be declared here AND in flake.nix.
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  # Defaults applied to all hosts unless overridden per-host.
  den.default.nixos.system.stateVersion = "26.05";
  den.default.homeManager.home.stateVersion = "26.05";

  # All users get home-manager integration by default.
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
