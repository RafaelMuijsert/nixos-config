{ inputs, ... }:
{
  flake-file.inputs = {
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.3";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.ful.hardware.secureboot.nixos = {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
