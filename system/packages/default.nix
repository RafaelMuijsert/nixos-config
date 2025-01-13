{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    helix
    wget
    file
    git
    tmux
    bat
    python3
  ];
}
