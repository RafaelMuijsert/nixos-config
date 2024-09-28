{inputs, ...} @ attrs: {
  imports = [inputs.home-manager.nixosModules.default];
  home-manager.users.rafael = import ./home.nix {inherit attrs;};
}
