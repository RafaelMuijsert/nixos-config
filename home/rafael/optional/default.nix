{
  home-manager.users.rafael = {
    imports = [
      ./kitty.nix
      ./i3-minimal.nix
      ./i3.nix
      ./rofi.nix
    ];
  };
}
