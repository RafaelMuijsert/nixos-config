{ config, lib, osConfig,...}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {

    xsession.windowManager.i3.config.fonts = {
      names = ["CaskaydiaCove Nerd Font Mono"];
      size = 12.0;
    };
  };
}
