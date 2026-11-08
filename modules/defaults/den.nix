{ den, inputs, ... }:
{
  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];
  den.default.includes = with den.batteries; [
    hostname
    inputs'
  ];
}
