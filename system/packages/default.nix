{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    helix
    wget
    file
    git
    tmux
    bat
    jq
    python3
    ripgrep
    tldr
  ];
}
