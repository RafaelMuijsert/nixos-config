{
  config,
  pkgs,
  ...
}: {
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Use NetworkManager for networking.
  networking = {
    hostName = "elite";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  desktop = {
    # Use the Sway-minimal desktop.
    sway-minimal.enable = true;
    # Use the Catppuccin theme.
    theme = import ../../themes/catppuccin;
  };
  # Enable laptop-specific configuration.
  isLaptop = true;

  # Install academia-related packages.
  academia = true;

  # Enable sync.
  services.syncthing = {
    enable = true;
    key = config.sops.secrets."syncthing-hosts/elite/key".path;
    cert = config.sops.secrets."syncthing-hosts/elite/cert".path;
  };

  # Enable fingerprint unlocking.
  services.fprintd.enable = true;

  # Enable virtualisation.
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.rafael.extraGroups = ["libvirtd"];

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        onevpl-intel-gpu
        intel-media-driver
      ];
    };
    bluetooth.enable = true;
  };

  system.stateVersion = "24.05";
}
