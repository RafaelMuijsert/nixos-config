{
  config,
  lib,
  osConfig,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf osConfig.academia {
    home.packages = [
      # Typst
      pkgs-unstable.typst
      pkgs-unstable.tinymist
    ];
  };
}
