{
  lib,
  ...
}: {
  options.secureBoot = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable secure boot through Lanzaboote.";
  };
}
