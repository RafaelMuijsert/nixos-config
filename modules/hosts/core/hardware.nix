{ config, lib, ... }:
{
  den.aspects.core.nixos = { modulesPath, ... }: {
    imports = [
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot = {
      initrd = {
        availableKernelModules = [
          "ata_piix"
          "uhci_hcd"
          "virtio_pci"
          "virtio_scsi"
          "sd_mod"
          "sr_mod"
        ];
        kernelModules = [ ];
      };
      loader.grub.enable = true;
      loader.grub.device = "/dev/sda";
      kernelModules = [ ];
      extraModulePackages = [ ];
    };

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/ce45022c-a2be-42c5-a38c-052a60ff7a1c";
      fsType = "ext4";
    };

    fileSystems."${config.media-drive}" = {
      device = "/dev/disk/by-uuid/6ebe3567-70cb-4deb-bcb5-9ed280971c92";
      fsType = "ext4";
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/23e62525-e4a8-4891-af53-9858bf4d5bc0"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
