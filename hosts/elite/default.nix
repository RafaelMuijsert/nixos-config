{
  let
    users = ["rafael"];
    modules = [];
  in {
    imports = [
      ./hardware-configuration ./config.nix ++
      map(x: ../../users + ("/" + x)) users ++
      map(x: ../../modules + ("/" + x)) modules;
    ]
  }
}
