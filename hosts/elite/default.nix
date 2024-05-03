{ ... }:
let 
  config = import ./config.nix;
in {
  imports = 
    [./hardware-configuration.nix ./config.nix] ++
    map(x: ../../users + ("/" + x)) config.users ++
    map(x: ../../modules + ("/" + x)) config.modules;
}
