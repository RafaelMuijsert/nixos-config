{pkgs, pkgs-unstable, ...}: {
  home-manager.users.rafael = {
    home.packages = [
      # General development
      pkgs-unstable.devenv

      # Nix development
      pkgs.nil
      
      # C Development
      pkgs.clang-tools
      pkgs.gnumake
      pkgs.gcc

      # Svelte development
      pkgs.nodePackages.svelte-language-server

      # HTML LSP
      pkgs.vscode-langservers-extracted
      pkgs.superhtml

      # TypeScript LSP
      pkgs.typescript-language-server

      # OBS
      pkgs.obs-studio

      # Godot
      pkgs.godot_4
      pkgs.libresprite

      # Rust development
      pkgs.rustc
      pkgs.rust-analyzer
      pkgs.cargo
      pkgs.clippy

      # Speech utilities
      pkgs.espeak

      # Music
      pkgs.nicotine-plus
      pkgs.picard
      pkgs-unstable.rmpc

      # Visualization
      pkgs.graphviz

      # Accounting
      pkgs.gnucash

      # Haskell development
      pkgs.ghc
    ];
  };
}
