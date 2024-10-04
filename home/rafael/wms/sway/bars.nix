{
  config,
  lib,
  osConfig,
  ...
}: {
  wayland.windowManager.sway.config.bars = [
    {
      position = "top";
      statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
      fonts = {
        names = ["monospace"];
        size = 12.0;
      };
      colors = {
        background = config.lib.stylix.colors.base01;
        focusedWorkspace = {
          background = config.lib.stylix.colors.base01;
          border = config.lib.stylix.colors.base01;
          text = config.lib.stylix.colors.base05;
        };
        inactiveWorkspace = {
          background = config.lib.stylix.colors.base01;
          border = config.lib.stylix.colors.base01;
          text = config.lib.stylix.colors.base03;
        };
      };
    }
  ];
}
