{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    services.picom = {
      enable = true;
      vSync = true;
    };
  };
}
