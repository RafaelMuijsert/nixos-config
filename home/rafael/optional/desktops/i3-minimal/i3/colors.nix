{ config, lib, osConfig, ...}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {

    xsession.windowManager.i3.config.colors = {
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
  };
}
