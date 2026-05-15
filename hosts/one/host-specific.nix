{
  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking.hostName = "one";

  imports = [
    ./services/immich.nix
    ./services/nginx.nix
    ./services/pinmedown.nix
    ./services/portfolio.nix
    ./services/snackvalue.nix
    ./services/syncthing.nix
    ./services/wireguard.nix
  ];

  system.stateVersion = "24.11";
}

