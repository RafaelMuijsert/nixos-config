{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        window = {
          border = 1;
          titlebar = false;
        };
      };
    };
  };
}
