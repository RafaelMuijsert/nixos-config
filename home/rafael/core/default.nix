{inputs, pkgs, path-utils, ...} : {
  imports = [inputs.home-manager.nixosModules.default];
  home-manager.users.rafael = {
    home = {
      username = "rafael";
      homeDirectory = "/home/rafael";
      stateVersion = "24.05";
      packages = with pkgs; [
        fishPlugins.hydro
        (nerdfonts.override {fonts = ["CascadiaCode" "Terminus"];})
      ];
    };
    programs.home-manager.enable = true;
    imports = builtins.concatMap (dir: path-utils.readDirectory dir) [
      ./programs
      ./themes
      ./settings
    ];
  };
}
