{ nixpkgs-stable, nixpkgs-unstable, ... }:
{
  environment.systemPackages = with nixpkgs-stable; [
    helix
    wget
    git
  ];

  imports = [
    ./locale.nix
    ./nix.nix
  ];
}
