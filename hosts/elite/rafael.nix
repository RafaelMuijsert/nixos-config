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
      # devenv
      devenv
    ];
  };
}
