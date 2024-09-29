{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  xsession.windowManager.i3 = {
    config = {
      modifier = "Mod4";
      window = {
        border = 1;
        titlebar = false;
      };
      startup = [
        { command = "{pkgs.feh}/bin/feh --bg-scale $HOME/.background-image"; notification = false; }
      ];
    };
  };
}
