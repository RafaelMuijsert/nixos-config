{
  nixpkgs-stable,
  nixpkgs-unstable,
  ...
}: {
  home = {
    username = "rafael";
    homeDirectory = "/home/rafael";
    stateVersion = "24.11";
    packages = with nixpkgs-unstable; [
      fishPlugins.hydro
    ];
  };
  programs.home-manager.enable = true;
  imports = [
    ./fish.nix
    ./zoxide.nix
    ./eza.nix
    ./fastfetch.nix
    ./git.nix
    ./helix.nix
    ./yazi.nix
    ./fzf.nix
    ./bat.nix
    ./btop.nix
    ./environment.nix
  ];
}