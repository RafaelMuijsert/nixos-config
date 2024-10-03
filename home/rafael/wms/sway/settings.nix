{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    config = {
      modifier = "Mod4";
      window = {
        border = 1;
        titlebar = false;
      };
      startup = [
        {
          command = "{pkgs.swaybg}/bin/swaybg --bg-scale $HOME/.background-image";
        }
      ];
    };
  };
}
