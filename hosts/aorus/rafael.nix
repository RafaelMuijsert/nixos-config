{ config, lib, pkgs, ... }: {
  home-manager.users.rafael = {
    home.packages = with pkgs; [      
      # C Development
      clang-tools
      gnumake
      gcc
    ];
    # Host-specific symlinks in home directory.
    imports = [./symlinks.nix];
  };
}
