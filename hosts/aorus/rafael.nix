{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.fish.interactiveShellInit = "devenv hook fish | source";
  home-manager.users.rafael = {
    home.packages = with pkgs; [
      # General development
      pkgs-unstable.devenv
      pkgs-unstable.opencode

      # Music
      ardour
      pkgs-unstable.ncspot
      nicotine-plus

      # Tools
      minisat

      # C Development
      clang-tools
      gnumake
      gcc

      # Game development
      godot_4
      libresprite

      # Gaming
      prismlauncher

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
