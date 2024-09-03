{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ attrs: let
    utils = import ./lib/utils.nix;
  in {
    nixosConfigurations.latitude = nixpkgs-unstable.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        nixpkgs-stable = import nixpkgs-stable {inherit system;};
        nixpkgs-unstable = import nixpkgs-unstable {inherit system;};
        inherit home-manager;
      };
      modules = utils.mkHost {
        hostname = "latitude";
        users = ["rafael"];
      };
    };
    nixosConfigurations.elite = nixpkgs-unstable.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        nixpkgs-stable = import nixpkgs-stable {inherit system;};
        nixpkgs-unstable = import nixpkgs-unstable {inherit system;};
        inherit home-manager;
      };
      modules = utils.mkHost {
        hostname = "elite";
        users = ["rafael"];
      };
    };
    formatter.x86_64-linux = nixpkgs-unstable.legacyPackages.x86_64-linux.alejandra;
  };
}
