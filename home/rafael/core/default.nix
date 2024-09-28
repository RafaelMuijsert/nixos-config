{inputs, ...} @ attrs: {
  imports = [inputs.home-manager.nixosModules.default];
  home-manager.users.rafael = {
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
    imports = builtins.concatMap (dir: attrs.path-utils.readDirectory dir) [
      ./programs
      ./themes
      ./settings
    ];
  };
}
