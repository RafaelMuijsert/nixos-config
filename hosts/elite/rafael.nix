{ pkgs, ... }:
{
  home-manager.users.rafael = {
    home.packages = with pkgs; [
      # Typst
      typst    
      typst-lsp
    ];
  };
}
