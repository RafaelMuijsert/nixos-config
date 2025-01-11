{config, lib, pkgs, ...}: {
  boot = lib.mkIf builtins.currentSystem.isLinux {
    consoleLogLevel = 3;
    initrd.verbose = true;
  };
}
