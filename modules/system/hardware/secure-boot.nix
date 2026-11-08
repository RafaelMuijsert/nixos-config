{ inputs, ... }:
{
  flake-file.inputs = {
    lanzaboote.url = "github:nix-community/lanzaboote/v1.2.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.ful.hardware.secureboot.nixos = {
    importsj = [ inputs.lanzaboote.nixosModules.lanzaboote ];

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
