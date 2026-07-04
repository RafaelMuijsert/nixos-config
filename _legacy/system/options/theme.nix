{
  options,
  lib,
  config,
  ...
}: {
  # Define options.
  options.desktop.theme = lib.mkOption {
    type = lib.types.attrs;
    default = import ../../themes/catppuccin-nix;
    description = "Set the desktop theme";
  };
}
