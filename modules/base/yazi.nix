{
  den.default.homeManager = { pkgs, pkgs-unstable, ... }: {
    programs.yazi = {
      enable = true;
      extraPackages = with pkgs; [
        ffmpeg
        jq
        poppler
        fd
        ripgrep
        fzf
        zoxide
        resvg
        imagemagick
        wl-clipboard
      ];
      package = pkgs-unstable.yazi;
      shellWrapperName = "y";
    };
  };
}
