{
  options,
  lib,
  config,
  ...
}: {
  options.isLaptop = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable laptop-only configuration options";
  };
}
