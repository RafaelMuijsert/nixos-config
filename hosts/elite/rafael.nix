{pkgs, ...}: {
  home-manager.users.rafael = {
    home.packages = with pkgs; [
      # C Development
      clang-tools
      gnumake
      gcc
      # Svelte development
      nodePackages.svelte-language-server
      # HTML LSP
      vscode-langservers-extracted
      superhtml
      # Godot
      godot_4
      # Rust development
      rustc
      rust-analyzer
      cargo
      clippy

      # Speech utilities
      espeak

      # Music
      nicotine-plus
      picard

      # Visualization
      graphviz
    ];
  };
}
