{ lib, pkgs, pkgs-unstable, ... }:
{
  programs.niri= {
    settings = {
      binds = {
        "Alt+Space".action.spawn = "${pkgs-unstable.fuzzel}/bin/fuzzel";
        "Mod+I".action.spawn = "${pkgs.firefox}/bin/firefox";

        "Mod+Shift+E".action.quit.skip-confirmation = true;
      };
      prefer-no-csd = true;
    };
  };
}
