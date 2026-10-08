{ lib, ... }:
{
  den.aspects.infra.nixos = { modulesPath, ... }: {
    imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

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
      loader.grub = {
        enable = true;
        device = "/dev/sda";
      };
      kernelModules = [ ];
      extraModulePackages = [ ];
    };

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/0da5ab07-2b35-42ca-86a0-7b9c45fef5ab";
      fsType = "ext4";
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/6cc4bfac-cc36-4410-9522-de8e97143651"; }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
