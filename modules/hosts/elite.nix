let
  hostname = "elite";
in
{
  /* Define host with users */
  den.hosts.x86_64-linux.${hostname} = {
    users.rafael = {};
  };

  /* Hardware configuration */
  den.aspects.${hostname} = {
    nixos = { config, lib, pkgs, ... }: {
      boot.loader.systemd-boot.enable = true;
      boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod"];
      boot.initrd.kernelModules = [];
      boot.kernelModules = ["kvm-intel"];
      boot.extraModulePackages = [];

      fileSystems."/" = {
        device = "/dev/mapper/luks-6d1f7eae-21ea-44b5-bca2-8a4e3cd9991b";
        fsType = "ext4";
      };

      boot.initrd.luks.devices."luks-6d1f7eae-21ea-44b5-bca2-8a4e3cd9991b".device = "/dev/disk/by-uuid/6d1f7eae-21ea-44b5-bca2-8a4e3cd9991b";

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/3FB6-1941";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };

      swapDevices = [
        {device = "/dev/mapper/luks-dc291857-82a6-4740-8e15-a41f5a5a94b8";}
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.enableRedistributableFirmware = true;
      hardware.cpu.intel.updateMicrocode = true;
    };
  };
}
