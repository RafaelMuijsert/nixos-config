{
  config,
  lib,
  osConfig,
  ...
}: {
  wayland.windowManager.sway.config.fonts = {
    names = ["CaskaydiaCove Nerd Font Mono"];
    size = 12.0;
  };
}
