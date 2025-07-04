{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bat
    duf
    dust
    fd
    file
    git
    helix
    lazygit
    jq
    python313
    procs
    ripgrep
    tldr
    tmux
    wget
    zellij
  ];
}
