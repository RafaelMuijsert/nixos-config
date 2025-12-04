{pkgs, ...}: {
  home-manager.users.rafael = {
    home.packages = [
      pkgs.ripgrep
    ];
  };
}
