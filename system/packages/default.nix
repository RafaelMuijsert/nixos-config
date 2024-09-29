{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    helix
    wget
    git
    tmux
    bat
    python3
  ];
}
