{ den, inputs, ... }:
{
  # Enable the den dendritic module framework with angle-bracket import syntax.
  # <desktop/niri> resolves to modules/gui/desktop/niri-desktop.nix via __findFile.
  # The flake-file + import-tree integration allows the modules/ directory
  # structure to drive all imports and host definitions automatically.
  _module.args.__findFile = den.lib.__findFile;

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];
}
