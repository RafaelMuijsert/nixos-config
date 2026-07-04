{
  options,
  lib,
  config,
  ...
}: {
  # Define options.
  options.desktop.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable a configuration of the Hyprland compositor with included utilities";
  };
}
