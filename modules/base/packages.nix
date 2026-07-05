{
  den.default.nixos = { pkgs, ... }: {
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
      ripgrep
      tldr
      watchexec
      wget
    ];
  };
}
