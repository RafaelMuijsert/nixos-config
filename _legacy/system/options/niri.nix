{
  options,
  lib,
  config,
  ...
}: {
  # Define options.
  options.desktop.niri.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable a configuration of the Niri compositor with included utilities";
  };
}
