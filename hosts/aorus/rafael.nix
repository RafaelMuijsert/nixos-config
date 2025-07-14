{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  home-manager.users.rafael = {
    home.packages = with pkgs; [
      # General development
      pkgs-unstable.devenv

      # Music
      pkgs-unstable.rmpc

      # C Development
      clang-tools
      gnumake
      gcc

      # Game development
      godot_4
      libresprite

      # HTML LSP
      pkgs.vscode-langservers-extracted
      pkgs.superhtml

      # TypeScript LSP
      pkgs.typescript-language-server


      # Haskell development
      ghc

    ];
    # Host-specific symlinks in home directory.
    imports = [./symlinks.nix];
  };
}
