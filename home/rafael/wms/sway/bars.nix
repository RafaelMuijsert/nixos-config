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
        focusedWorkspace = {
          background = "#000000";
          border = "#000000";
          text = "#ffffff";
        };
        inactiveWorkspace = {
          background = "#000000";
          border = "#000000";
          text = "#646464";
        };
      };
    }
  ];
}
