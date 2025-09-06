{
  config,
  lib,
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
    wireguard.interfaces = {
      wg0 = {
        mtu = 1386;
        ips = [ "192.168.100.2/32" ];
        privateKeyFile = config.sops.secrets."vpn-clients/elite".path;
        peers = [
          {
            publicKey = "zl1uvtjHGE85d6VcISlTbOc1W7ragmhdPcdJqnDBTx0=";
            allowedIPs = [ "192.168.42.0/24" ];
            endpoint = "vpn.muijsert.org:51820";
          }
        ];
      };
    };
  };

  desktop = {
    sway-minimal.enable = true;
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

  # Enable sync.
  services.syncthing = {
    enable = true;
    key = config.sops.secrets."syncthing-hosts/elite/key".path;
    cert = config.sops.secrets."syncthing-hosts/elite/cert".path;
    settings.devices = {
      "one" = {id = "37VH62T-5UP3BSB-OKYPGOY-IGXFVFU-DHXXQQ3-3GW6INY-YTQJJYR-XXXGEQB";};
    };
  };

  # Enable fingerprint unlocking.
  services.fprintd.enable = true;

  # Enable virtualisation.
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.rafael.extraGroups = ["libvirtd"];

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
