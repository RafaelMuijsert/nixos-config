{ pkgs, ...}: {
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Use NetworkManager for networking.
  networking = {
    hostName = "aorus";
    networkmanager.enable = true;
  };

  desktop = {
    # Use the Sway-minimal desktop.
    sway-minimal.enable = true;
    # Use the Catppuccin theme.
    theme = import ../../themes/catppuccin;
  };

  # Install academia-related packages.
  academia = true;

  # Enable sync
  services.syncthing.enable = true;

  system.stateVersion = "24.05";
}