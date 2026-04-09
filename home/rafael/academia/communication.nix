{
  lib,
  pkgs,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.academia {
    home.packages = with pkgs; [
      telegram-desktop
    ];
  };
}
