{ lib, pkgs-unstable, ... }:
{
  programs.fuzzel = {
    settings = {
      main = {
        placeholder = "Quick Search";
        prompt = "\" \"";
        dpi-aware = lib.mkForce "yes";
        horizontal-pad = 20;
        vertical-pad = 20;
        inner-pad = 20;
      };
      border = {
        radius = 0;
      };
    };
    package = pkgs-unstable.fuzzel;
  };
}
