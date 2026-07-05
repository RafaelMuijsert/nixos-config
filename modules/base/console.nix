{
  den.default.nixos = { pkgs, ... }: {
    i18n.console = {
      font = "ter-114n";
      keyMap = "us";
      packages = with pkgs; [
        terminus_font
      ];
    };
  };
}
