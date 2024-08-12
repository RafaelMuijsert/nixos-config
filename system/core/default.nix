{ nixpkgs-stable, nixpkgs-unstable, ... }:
{
  environment.systemPackages = with nixpkgs-stable; [
    helix
    wget
    git
    tmux
  ];

  imports = [
    ./locale.nix
    ./nix.nix
  ];
}
