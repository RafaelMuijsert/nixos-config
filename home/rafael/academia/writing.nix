{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.academia.enable {
    home.packages = with pkgs; [
      # Typst
      typst  
      typst-lsp
    ];
  };
}
