{ nixpkgs-stable, nixpkgs-unstable, ... }:
{
  home = {
    username = "rafael";
    homeDirectory = "/home/rafael";
    stateVersion = "24.11";
    packages = with nixpkgs-unstable; [
      fishPlugins.hydro      
    ];
  };
  programs.home-manager.enable = true;
}