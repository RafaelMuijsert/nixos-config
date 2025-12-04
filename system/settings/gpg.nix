{pkgs, ...}: {
  programs.gnupg = {
    # enable = true;
    agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}
