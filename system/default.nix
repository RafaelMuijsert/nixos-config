{
  pathUtils,
  pkgs,
  outputs,
  ...
}: {
  # System packages included in every host.
  environment.systemPackages = with pkgs; [
    helix
    wget
    git
    tmux
    bat
    python3
  ];

  # Apply nixpkgs overlay.
  nixpkgs.overlays = [outputs.overlays.nixpkgs-unstable];

  imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
    ./desktops
    ./packages
    ./settings
  ];
}
