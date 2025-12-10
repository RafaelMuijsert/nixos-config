{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    consoleLogLevel = 3;
    initrd.verbose = true;
    loader.systemd-boot.enable = lib.mkForce false;
  };

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
