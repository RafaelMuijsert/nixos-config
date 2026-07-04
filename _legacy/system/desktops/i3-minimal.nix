{
  options,
  lib,
  config,
  ...
}: {
  # Implement options.
  config = lib.mkIf config.desktop.i3-minimal.enable {
    services.xserver = {
      enable = true;
      windowManager.i3.enable = true;
      displayManager.startx.enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    stylix.enable = true;
  };
}
