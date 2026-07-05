{ __findFile, ... }:
let
  hostname = "elite";
  root = "6d1f7eae-21ea-44b5-bca2-8a4e3cd9991b";
  swap = "dc291857-82a6-4740-8e15-a41f5a5a94b8";
  esp = "3FB6-1941";
in
{
  /* Hardware configuration */
  den.aspects.${hostname} = {
    nixos = { config, lib, pkgs, ... }: {
      boot.loader.systemd-boot.enable = true;
      boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod"];
      boot.initrd.kernelModules = [];
      boot.kernelModules = ["kvm-intel"];
      boot.extraModulePackages = [];

      fileSystems."/" = {
        device = "/dev/mapper/luks-${root}";
        fsType = "ext4";
      };

      # Encrypted root
      boot.initrd.luks.devices."luks-${root}".device = "/dev/disk/by-uuid/${root}";

      # Encrypted swap
      boot.initrd.luks.devices."luks-${swap}".device = "/dev/disk/by-uuid/${swap}";

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/${esp}";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };

      swapDevices = [
        {device = "/dev/mapper/luks-${swap}";}
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.enableRedistributableFirmware = true;
      hardware.cpu.intel.updateMicrocode = true;
    };
  };
}
