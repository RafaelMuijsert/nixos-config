{ lib, ... }:
{
  # Flake inputs
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  # System state version
  den.default.nixos.system.stateVersion = "26.05";
  den.default.homeManager.home.stateVersion = "26.05";

  # Enable home-manager by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
