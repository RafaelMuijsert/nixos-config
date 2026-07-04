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
    kernelParams = [ "quiet" "splash" ];

    initrd.verbose = true;

    lanzaboote = {
      enable = config.secureBoot;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
