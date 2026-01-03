{
  config,
  lib,
  ...
}: {

  boot = {
    consoleLogLevel = 3;
    initrd.verbose = true;
    loader.systemd-boot.enable = !config.secureBoot;

    lanzaboote = {
      enable = config.secureBoot;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}

