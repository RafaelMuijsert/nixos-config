{
  options,
  lib,
  config,
  ...
}: {
  options.academia = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable academia-related options.";
  };
}
