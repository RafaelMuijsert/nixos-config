{ lib, pkgs, pkgs-unstable, ... }:
{
  programs.niri= {
    settings = {
      binds = {
        "Mod+D".action.spawn = "${pkgs.fuzzel}/bin/fuzzel";

        "Mod+Shift+E".action.quit.skip-confirmation = true;
      };
    };
  };
}
