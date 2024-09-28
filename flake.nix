{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = {
    nixpkgs-stable,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    hostLib = import ./lib/host.nix {inherit inputs;};
  in {
    nixosConfigurations.latitude = hostLib.mkHost {
      name = "latitude";
      system = "x86_64-linux";
      base = nixpkgs-unstable;
      users = ["rafael"];
    };
    nixosConfigurations.elite = hostLib.mkHost {
      name = "elite";
      system = "x86_64-linux";
      base = nixpkgs-unstable;
      users = ["rafael"];
    };
    nixosConfigurations.thinkcentre = hostLib.mkHost {
      name = "thinkcentre";
      system = "x86_64-linux";
      base = nixpkgs-unstable;
      users = ["rafael"];
    };
    formatter.x86_64-linux = nixpkgs-unstable.legacyPackages.x86_64-linux.alejandra;
  };
}
