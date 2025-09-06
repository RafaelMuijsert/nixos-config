{
  config,
  lib,
  osConfig,
  ...
}: {
  wayland.windowManager.sway.config.bars = [
    {
      position = "bottom";
      statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
      fonts = {
        names = ["monospace"];
        size = 12.0;
      };
      colors = {
        background = config.lib.stylix.colors.base00;
        focusedWorkspace = {
          background = config.lib.stylix.colors.base00;
          border = config.lib.stylix.colors.base00;
          text = config.lib.stylix.colors.base07;
        };
        inactiveWorkspace = {
          background = config.lib.stylix.colors.base00;
          border = config.lib.stylix.colors.base00;
          text = config.lib.stylix.colors.base03;
        };
      };
    }
  ];
}
