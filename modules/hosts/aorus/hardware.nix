{
  den.aspects.aorus.nixos = { modulesPath, ... }: {
    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot = {
      initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "sd_mod"
      ];
      initrd.kernelModules = [ ];
      kernelModules = [ "kvm-amd" ];
      extraModulePackages = [ ];
    };

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/5438798b-2a9a-4f26-8582-a3216d87a05d";
        fsType = "ext4";
      };

      "/boot" = {
        device = "/dev/disk/by-uuid/D881-829E";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };


      "/mnt/data" = {
        device = "/dev/disk/by-uuid/2d87badb-b4d6-4a83-ab65-652e7c3b9241";
        fsType = "btrfs";
      };
    };

    swapDevices = [ ];

    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = true;
  };
}
