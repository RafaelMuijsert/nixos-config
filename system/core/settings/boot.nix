{pkgs, ...}: {
  boot = {
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };
    consoleLogLevel = 3;
    initrd.verbose = true;
  };
}
