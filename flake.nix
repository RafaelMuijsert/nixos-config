{
  description = "A modular, extensible NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin?ref=nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.3";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-25.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    portfolio.url = "github:RafaelMuijsert/next-portfolio";
    portfolio.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    hostLib = import ./lib/host.nix;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    darwinPkgs = nixpkgs.legacyPackages.aarch64-darwin;

    mkLinux = name: hostLib.mkHost {
      inherit name inputs;
      system = "x86_64-linux";
      users = ["rafael"];
    };
  in {
    /* NixOS configurations */
    nixosConfigurations = {
      /* Live ISO for installing/troubleshooting */
      iso = mkLinux "iso";
      /* HP EliteBook */
      elite = mkLinux "elite";
      /* Aorus PC */
      aorus = mkLinux "aorus";
      /* Homeserver */
      one = mkLinux "one";
    };

    /* Darwin configurations */
    darwinConfigurations = {
      air = hostLib.mkDarwinHost {
        name = "air";
        system = "aarch64-darwin";
        users = ["rafael"];
        inherit inputs;
      };
    };

    formatter = {
      x86_64-linux = pkgs.alejandra;
      aarch64-darwin = darwinPkgs.alejandra;
    };

    devShell = let
      shellPkgs = pkgs: with pkgs; [
        just
        age
        sops
      ];
    in {
      x86_64-linux = pkgs.mkShell { buildInputs = shellPkgs pkgs; };
      aarch64-darwin = darwinPkgs.mkShell { buildInputs = shellPkgs darwinPkgs; };
    };
  };
}
