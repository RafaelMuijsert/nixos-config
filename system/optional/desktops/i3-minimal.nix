{
  options,
  lib,
  config,
  ...
}: {
  options.desktop.i3-minimal.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable a minimal configuration of the i3 window manager with included utilities";
  };
  options.desktop.i3-minimal.isLaptop = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable laptop-only configuration options";
  };
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
  };
}