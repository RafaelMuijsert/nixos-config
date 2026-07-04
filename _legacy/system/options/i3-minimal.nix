{
  options,
  lib,
  config,
  ...
}: {
  # Define options.
  options.desktop.i3-minimal.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable a minimal configuration of the i3 window manager with included utilities";
  };
}
