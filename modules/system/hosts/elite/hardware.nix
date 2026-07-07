{ __findFile, ... }:
let
  hostname = "elite";
  root = "6d1f7eae-21ea-44b5-bca2-8a4e3cd9991b";  # LUKS-encrypted root partition
  swap = "dc291857-82a6-4740-8e15-a41f5a5a94b8";  # LUKS-encrypted swap partition
  esp = "3FB6-1941";                                 # EFI system partition
in
{
  # Elite hardware configuration: Intel laptop with full disk encryption,
  # Thunderbolt support, NVMe storage, and Intel CPU microcode updates.
  # LUKS is used for both root and swap; the ESP is mounted with restricted
  # permissions (fmask=0077, dmask=0077) to prevent unauthorized access.
  den.aspects.${hostname} = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        boot.initrd.availableKernelModules = [
          "xhci_pci"
          "thunderbolt"
          "nvme"
          "usb_storage"
          "sd_mod"
        ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-intel" ];
        boot.extraModulePackages = [ ];

        # LUKS-encrypted root filesystem
        fileSystems."/" = {
          device = "/dev/mapper/luks-${root}";
          fsType = "ext4";
        };

        # Decrypt root on boot via initrd
        boot.initrd.luks.devices."luks-${root}".device = "/dev/disk/by-uuid/${root}";

        # Decrypt swap on boot via initrd
        boot.initrd.luks.devices."luks-${swap}".device = "/dev/disk/by-uuid/${swap}";

        # EFI system partition — restricted permissions for security
        fileSystems."/boot" = {
          device = "/dev/disk/by-uuid/${esp}";
          fsType = "vfat";
          options = [
            "fmask=0077"
            "dmask=0077"
          ];
        };

        # Encrypted swap
        swapDevices = [
          { device = "/dev/mapper/luks-${swap}"; }
        ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.enableRedistributableFirmware = true;
        hardware.cpu.intel.updateMicrocode = true;
      };
  };
}
