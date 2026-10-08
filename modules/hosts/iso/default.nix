{
  lib,
  modulesPath,
  ...
}:
let
  hostname = "iso";
in
{
    # Define host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
    theme = {
      scheme = ../../theme/catppuccin/scheme.yaml;
      polarity = "dark";
      wallpaper = ../../theme/catppuccin/wallpaper.png;
    };
  };


  den.aspects.iso = {
    includes = [
      <desktop/niri>
      <theme/catppuccin>
    ];
    nixos = {
      # Auto login
      services.getty = {
        autologinUser = lib.mkForce "rafael";
        helpLine = ''
          Custom NixOS Live ISO.

          Contains configured recovery tools and desktop.
        '';
      };

      # Auto-start sway
      environment.loginShellInit = ''
        [[ "$(tty)" == /dev/tty1 ]] && sway
      '';

      # ISO image specific configuration
      isoImage = {
        appendToMenuLabel = " Live System";
      };
    };
  };
}
