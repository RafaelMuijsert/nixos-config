{
  attrs,
  ...
}: {
  home = {
    username = "rafael";
    homeDirectory = "/home/rafael";
    stateVersion = "24.11";
    packages = with attrs.nixpkgs-unstable; [
      fishPlugins.hydro
      (nerdfonts.override {fonts = ["CascadiaCode" "Terminus"];})
    ];
  };
  programs.home-manager.enable = true;
  imports = builtins.concatMap(dir: attrs.path-utils.readDirectory dir) [
    ./programs 
    ./themes 
    ./settings
  ];
  # imports = builtins.map(file: toString ./programs + "/${file}") (builtins.attrNames (builtins.readDir ./programs));
  # imports = [
  #   ./fish.nix
  #   ./zoxide.nix
  #   ./eza.nix
  #   ./fastfetch.nix
  #   ./git.nix
  #   ./helix.nix
  #   ./yazi.nix
  #   ./fzf.nix
  #   ./bat.nix
  #   ./btop.nix
  #   ./environment.nix
  #   ./fonts.nix
  #   ./dark-theme.nix
  # ];
}
