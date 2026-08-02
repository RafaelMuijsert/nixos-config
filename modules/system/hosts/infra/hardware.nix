{ lib, ... }:
{
  den.aspects.infra.nixos = { config, modulesPath, ... }: {
    imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

    boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/0da5ab07-2b35-42ca-86a0-7b9c45fef5ab";
        fsType = "ext4";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/2109cd6f-7eaa-45a3-a7d9-dad9248f72da"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
