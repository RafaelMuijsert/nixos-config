{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    home.file.".xinitrc".text = ''
      picom & 
      feh --bg-scale ${osConfig.desktop.theme.wallpaper} &
      exec i3
    '';
  };
}
