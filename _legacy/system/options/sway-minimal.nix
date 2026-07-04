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
}
