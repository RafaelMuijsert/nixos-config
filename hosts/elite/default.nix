{
  let config = import ./config.nix;
  in {
    imports = [
      ./hardware-configuration ./config.nix ++
      map(x: ../../users + ("/" + x)) users ++
      map(x: ../../modules + ("/" + x)) modules;
    ]
  }
}
