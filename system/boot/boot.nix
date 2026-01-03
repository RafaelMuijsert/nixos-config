{
  config,
  lib,
  ...
}: {

  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = !config.secureBoot;

    consoleLogLevel = 3;
    initrd.verbose = true;

    lanzaboote = {
      enable = config.secureBoot;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}

