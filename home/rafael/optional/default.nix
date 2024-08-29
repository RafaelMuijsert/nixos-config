{
  home-manager.users.rafael = {
    imports = [
      ./kitty.nix
      ./i3-minimal.nix
    ];
  };
}
