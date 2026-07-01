{
  config,
  lib,
  ...
}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 0;
      systemd-boot = {
        enable = !config.secureBoot;
        consoleMode = "max";
      };
    };

    consoleLogLevel = 4;
    initrd.verbose = true;

    lanzaboote = {
      enable = config.secureBoot;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
