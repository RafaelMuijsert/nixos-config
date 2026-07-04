{
  config,
  lib,
  osConfig,
  pkgs,
  pkgs-unstable,
  ...
}: {
  wayland.windowManager.sway = {
    config = {
      assigns = {
        "11" = [{app_id = "org.telegram.desktop";}];
        "12" = [{app_id = "thunderbird";}];
      };
    };
  };
}
