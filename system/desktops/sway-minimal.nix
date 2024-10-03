{
  options,
  lib,
  config,
  ...
}: {
  # Define options.
  options.desktop.sway-minimal.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable a minimal configuration of the Sway compositor with included utilities";
  };

  # Implement options.
  config = lib.mkIf config.desktop.sway-minimal.enable {
    programs.sway = {
      enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };
}
