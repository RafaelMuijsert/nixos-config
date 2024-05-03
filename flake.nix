{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  } @ inputs: let
    inherit (self) outputs;
    mkHost = host:
      nixpkgs.lib.nixosSystem {
        modules = [host ./modules/common];
        specialArgs = {inherit inputs outputs;};
      };
  in {
    nixosConfigurations = {
      elite = mkHost ./hosts/elite;
    };
  };
}
