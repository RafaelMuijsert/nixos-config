{ lib, pkgs-unstable, ... }:
{
  programs.fuzzel = {
    settings = {
      main = {
        placeholder = "Type to search: ";
        dpi-aware = lib.mkForce "yes";
      };
    };
    package = pkgs-unstable.fuzzel;
  };
}
