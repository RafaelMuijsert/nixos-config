{lib, modulesPath, ...}: {
  # Default installer configuration
  imports = ["${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"];

  # Networking
  networking = {
    hostName = "nixos-live";
    networkmanager.enable = true;
  };

  # Enable sway desktop
  desktop = {
    sway-minimal.enable = true;
    theme = import ../../themes/catppuccin-nix;
  };

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
}

