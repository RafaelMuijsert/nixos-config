{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.academia {
    home.packages = with pkgs; [
      # Typst
      typst
      typst-lsp
    ];
  };
}
