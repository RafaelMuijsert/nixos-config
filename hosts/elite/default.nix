{...}: let
  vars = import ./config.nix;
in {
  imports =
    [./hardware-configuration.nix ./config.nix]
    ++ map (x: ../../users + ("/" + x)) vars.hostUsers
    ++ map (x: ../../modules + ("/" + x)) vars.hostModules;
}
