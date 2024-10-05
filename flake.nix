{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/cf8b6e2d4e8aca8ef14b839a906ab5eb98b08561";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    hostLib = import ./lib/host.nix;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
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
    nixosConfigurations.aorus = hostLib.mkHost {
      name = "aorus";
      system = "x86_64-linux";
      users = ["rafael"];
      inherit inputs;
    };
    formatter.x86_64-linux = pkgs.alejandra;
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs; [
        just
        age
      ];
    };
  };
}
