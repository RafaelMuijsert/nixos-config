{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    helix
    wget
    file
    git
    tmux
    bat
    jq
    python313
    ripgrep
    tldr
  ];
}
