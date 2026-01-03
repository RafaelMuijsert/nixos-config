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
    firewall.enable = false;
  };

  desktop = {
    niri.enable = true;
    theme = import ../../themes/catppuccin-nix;
  };

  # Install academia-related packages.
  academia = true;

  # Use secure boot.
  secureBoot = true;

  programs.virt-manager = {
    enable = true;
  };
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };
  users.groups.libvirtd.members = ["rafael"];

  # Enable virtual camera
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

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
      "elite" = {id = "OSGHMZK-KYEI6ET-F7B6GBM-5B4FBU2-U5LA4J4-T5KIRBY-PPPW3UX-5AZD4AS";};
    };
    settings.folders.Documents.devices = ["one" "elite"];
    settings.folders.Music.devices = ["one" "elite"];
    settings.folders.Pictures.devices = ["one" "elite"];
  };

  # udev rule to prevent suspend wakeups from USB controller
  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x1483" ATTR{power/wakeup}="disabled"
  '';

  # Suspend when power button is pressed
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    IdleAction = "suspend";
    IdleActionSec = 600;
  };

  system.stateVersion = "24.05";
}
