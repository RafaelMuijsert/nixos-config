{
  pathUtils,
  pkgs,
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

  imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
    ./desktops
    ./packages
    ./settings
  ];
}
