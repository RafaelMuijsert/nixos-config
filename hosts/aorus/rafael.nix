{
  config,
  lib,
  pkgs,
  ...
}: {
  home-manager.users.rafael = {
    home.packages = with pkgs; [
      # C Development
      clang-tools
      gnumake
      gcc

      # ollama development
      python312Packages.ollama
    ];
    # Host-specific symlinks in home directory.
    imports = [./symlinks.nix];
  };
}
