{pkgs, ...}: {
  boot = {
    consoleLogLevel = 3;
    initrd.verbose = true;
  };
}
