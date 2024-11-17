{
  inputs,
  pkgs,
  pkgs-unstable,
  pathUtils,
  ...
}: {
  # Configure home-manager.
  home-manager.users.rafael = {
    home = {
      username = "rafael";
      homeDirectory = "/home/rafael";
      stateVersion = "24.05";
      packages = [
        pkgs.fishPlugins.pure
        pkgs.unzip
        pkgs.ffmpeg
        pkgs-unstable.rmpc
      ];
    };
    # Define programs to be enabled for this user across all hosts.
    programs = {
      bat.enable = true;
      btop.enable = true;
      direnv.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      gpg.enable = true;
      home-manager.enable = true;
      fish.enable = true;
      fzf.enable = true;
      git.enable = true;
      helix.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    # Enable XDG user dirs.
    xdg.userDirs.enable = true;

    imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
      ./academia
      ./desktops
      ./environment
      ./programs
      ./settings
      ./themes
      ./wms/i3
      ./wms/sway
    ];
  };
}
