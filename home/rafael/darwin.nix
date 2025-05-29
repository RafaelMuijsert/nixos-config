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
      stateVersion = "24.11";
      packages = [
        pkgs.unzip
        pkgs.ffmpeg
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
      gh.enable = true;
      home-manager.enable = true;
      fish.enable = true;
      fzf.enable = true;
      git.enable = true;
      helix.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
      ./academia
      ./desktops
      ./environment
      ./programs
      ./settings
    ];
  };
}
