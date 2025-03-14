{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Use NetworkManager for networking.
  networking = {
    hostName = "one";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.11";
}
