{ pkgs, ...}: {
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

  desktop = {
    # Use the Sway-minimal desktop.
    sway-minimal.enable = true;
    # Use the minimal theme.
    theme = import ../../themes/minimal;
  };
  # Enable laptop-specific configuration.
  isLaptop = true;

  # Enable virtualisation.
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.rafael.extraGroups = [ "libvirtd" ];


  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      onevpl-intel-gpu
      intel-media-driver
    ];
  };

  system.stateVersion = "24.05";
}
