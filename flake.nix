{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, ... } @ attrs: {
    nixosConfigurations.latitude = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
    };
  };
}
