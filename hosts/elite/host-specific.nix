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
    hyprland.enable = true;
    # Use the Catppuccin theme.
    theme = import ../../themes/catppuccin-yosemite;
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

  # Enable database
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-media-driver
      ];
    };
    bluetooth = {
      enable = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Disable = "Headset";
      };
    };
  };

  system.stateVersion = "24.05";
}
