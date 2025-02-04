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

      # Music
      nicotine-plus
      picard
    ];
  };
}
