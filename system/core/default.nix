{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    helix
    wget
    git
    tmux
    bat
  ];

  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-c16n.psf.gz";

  imports = [
    ./locale.nix
    ./nix.nix
    ./boot.nix
    ./xorg.nix
  ];
}
