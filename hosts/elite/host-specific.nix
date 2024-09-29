{ pkgs, ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Use NetworkManager for networking.
  networking = {
    hostName = "elite";
    networkmanager.enable = true;
  };

  # Use the i3-minimal desktop.
  desktop.i3-minimal.enable = true;
  desktop.i3-minimal.isLaptop = true;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      onevpl-intel-gpu
      intel-media-driver
    ];
  };

  system.stateVersion = "24.05";
}
