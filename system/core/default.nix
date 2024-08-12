{ nixpkgs-stable, nixpkgs-unstable, ... }:
{
  environment.systemPackages = with nixpkgs-stable; [
    helix
    wget
    git
    tmux
    bat
  ];

  console.font = "${nixpkgs-stable.terminus_font}/share/consolefonts/ter-c16n.psf.gz";

  imports = [
    ./locale.nix
    ./nix.nix
  ];
}
