{ den, inputs, ... }:
{
  # Enable angle bracket syntax
  _module.args.__findFile = den.lib.__findFile;

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];
}
