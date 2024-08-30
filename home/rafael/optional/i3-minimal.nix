{
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs = {
      kitty.enable = true;
      firefox.enable = true;
    };

    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        window = {
          border = 1;
          titlebar = false;
        };
        fonts = {
          names = [ "CaskaydiaCove Nerd Font Mono" ];
          size = 12.0;
        };
        colors = {
          focused = {
            background = "#000000";
            border = "#484848";
            childBorder = "#484848";
            indicator = "#484848";
            text = "#ffffff";
          };
          unfocused = {
            background = "#000000";
            border = "#000000";
            childBorder = "#000000";
            indicator = "#000000";
            text = "#ffffff";
          };
        };
        bars = [
          {
            position = "top";
            fonts = {
              names = [ "CaskaydiaCove Nerd Font Mono" ];
              size = 12.0;
            };
            colors = {
              focusedWorkspace = {
                background = "#484848";
                border = "#484848";
                text = "#ffffff";
              };
              inactiveWorkspace = {
                background = "#000000";
                border = "#000000";
                text = "#ffffff";
              };
            };
          }
        ];
      };
    };

    home.sessionVariables = {
      TERMINAL = "kitty";
      BROWSER = "firefox";
    };
  };
}
