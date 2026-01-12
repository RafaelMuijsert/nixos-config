{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bat
    duf
    dust
    fd
    file
    ffmpeg
    git
    helix
    just
    lazygit
    jq
    python314
    procs
    ripgrep
    sbctl
    tldr
    tmux
    unzip
    wget
  ];
}
