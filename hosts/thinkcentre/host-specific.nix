{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Use NetworkManager for networking.
  networking = {
    hostName = "thinkcentre";
    networkmanager.enable = true;
  };

  # Use the i3-minimal desktop.
  desktop.i3-minimal.enable = true;
  desktop.theme = import ../../themes/windows;

  system.stateVersion = "24.05";
}
