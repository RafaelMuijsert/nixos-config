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
    python314
    procs
    ripgrep
    sbctl
    tldr
    tmux
    wget
  ];
}
