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
        pkgs.fishPlugins.done
        pkgs.fishPlugins.pure
        pkgs.glow
        pkgs.unzip
        pkgs.ffmpeg
      ];
      shell.enableFishIntegration = true;
    };
    # Define programs to be enabled for this user across all hosts.
    programs = {
      bat.enable = true;
      btop.enable = true;
      direnv.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      gh.enable = true;
      gpg.enable = true;
      home-manager.enable = true;
      fish.enable = true;
      fzf.enable = true;
      git.enable = true;
      helix.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    services = {
      gpg-agent.enable = true;
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
      ./wms/hyprland
    ];
  };
}
