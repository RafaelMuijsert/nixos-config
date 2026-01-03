{
  config,
  pkgs,
  ...
}: {
  # Use NetworkManager for networking.
  networking = {
    hostName = "elite";
    networkmanager.enable = true;
    firewall.enable = false;
    wireguard.interfaces = {
      wg0 = {
        mtu = 1386;
        ips = ["192.168.100.2/32"];
        privateKeyFile = config.sops.secrets."vpn-clients/elite".path;
        peers = [
          {
            publicKey = "zl1uvtjHGE85d6VcISlTbOc1W7ragmhdPcdJqnDBTx0=";
            allowedIPs = ["192.168.42.0/24"];
            endpoint = "vpn.muijsert.org:51820";
          }
        ];
      };
    };
  };

  # Full disk encryption
  boot.initrd.luks.devices."luks-dc291857-82a6-4740-8e15-a41f5a5a94b8".device = "/dev/disk/by-uuid/dc291857-82a6-4740-8e15-a41f5a5a94b8";

  desktop = {
    niri.enable = true;
    theme = import ../../themes/catppuccin-nix;
  };

  # stylix.fonts.monospace = lib.mkForce {
  #   package = pkgs.nerd-fonts.caskaydia-mono;
  #   name = "CaskaydiaMono Nerd Font Mono";
  # };

  # Enable laptop-specific configuration.
  isLaptop = true;

  # Install academia-related packages.
  academia = true;

  # Use secure boot.
  secureBoot = true;

  # Enable sync.
  services.syncthing = {
    enable = true;
    key = config.sops.secrets."syncthing-hosts/elite/key".path;
    cert = config.sops.secrets."syncthing-hosts/elite/cert".path;
    settings.devices = {
      "one" = {id = "37VH62T-5UP3BSB-OKYPGOY-IGXFVFU-DHXXQQ3-3GW6INY-YTQJJYR-XXXGEQB";};
      "aorus" = {id = "FSFRLFB-FPC2GX6-H34V4YQ-ZS5FJ3M-NT6IZF5-567G3JA-CHBDLUN-TTCUUAN";};
    };
    settings.folders.Documents.devices = ["one" "aorus"];
    settings.folders.Music.devices = ["one" "aorus"];
    settings.folders.Pictures.devices = ["one" "aorus"];
  };

  # Enable fingerprint unlocking.
  services.fprintd.enable = true;

  # Enable virtualisation.
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.rafael.extraGroups = ["libvirtd"];

  # Hibernate when power button pressed
  services.logind.settings.Login = {
    HandlePowerKey = "hibernate";
  };


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
