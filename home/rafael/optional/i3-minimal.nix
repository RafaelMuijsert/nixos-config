{ lib, config, osConfig, ...}:
{
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs = {
      kitty.enable = true;
      firefox.enable = true;
    };

    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        keybindings."Mod4+i" = "exec $BROWSER";
        bars = [
          {
            position = "top";
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
