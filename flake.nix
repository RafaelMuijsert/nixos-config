{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    ...
  } @ inputs: let
    hostLib = import ./lib/host.nix {inherit inputs;};
  in {
    nixosConfigurations.latitude = hostLib.mkHost {
      name = "latitude";
      system = "x86_64-linux";
      users = ["rafael"];
      inherit inputs;
    };
    nixosConfigurations.elite = hostLib.mkHost {
      name = "elite";
      system = "x86_64-linux";
      users = ["rafael"];
      inherit inputs;
    };
    nixosConfigurations.thinkcentre = hostLib.mkHost {
      name = "thinkcentre";
      system = "x86_64-linux";
      users = ["rafael"];
      inherit inputs;
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
