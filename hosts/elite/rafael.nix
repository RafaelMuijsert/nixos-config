{pkgs, ...}: {
  home-manager.users.rafael = {
    home.packages = with pkgs; [
      # C Development
      clang-tools
      gnumake
      gcc
    ];
  };
}
