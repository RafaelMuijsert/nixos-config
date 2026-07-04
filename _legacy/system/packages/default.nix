{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bat
    duf
    dust
    fd
    file
    git
    helix
    jq
    just
    python314
    procs
    ripgrep
    sbctl
    tldr
    tmux
    watchexec
    wget
  ];
}
