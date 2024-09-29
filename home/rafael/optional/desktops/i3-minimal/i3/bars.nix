{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    xsession.windowManager.i3.config.bars = [
      {
        position = "top";
        statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
        fonts = {
          names = ["CaskaydiaCove Nerd Font Mono"];
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
  };
}
