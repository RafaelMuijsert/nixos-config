{pkgs, ...}: {
  programs.gpg = {
  };
  services.gpg-agent = {
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
