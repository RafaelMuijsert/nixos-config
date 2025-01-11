{
  options,
  lib,
  config,
  ...
}: {
  # Define options.
  options.desktop.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Set the desktop theme";
  };
}
