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
    hostName = "aorus";
    networkmanager.enable = true;
  };

  desktop = {
    # Use the Sway-minimal desktop.
    sway-minimal.enable = true;
    # Use the Catppuccin theme.
    theme = import ../../themes/catppuccin-nix;
  };

  # Install academia-related packages.
  academia = true;

  # Enable ollama
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    rocmOverrideGfx = "10.1.0";
    home = "/mnt/data/Ollama";
    models = "/mnt/data/Ollama/Models";
  };

  # Enable sync
  services.syncthing = {
    enable = true;
    key = config.sops.secrets."syncthing-hosts/aorus/key".path;
    cert = config.sops.secrets."syncthing-hosts/aorus/cert".path;
    settings.devices = {
      "one" = {id = "37VH62T-5UP3BSB-OKYPGOY-IGXFVFU-DHXXQQ3-3GW6INY-YTQJJYR-XXXGEQB";};
    };
  };

  # udev rule to prevent suspend wakeups from USB controller
  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x149c" ATTR{power/wakeup}="disabled"
  '';


  system.stateVersion = "24.05";
}
