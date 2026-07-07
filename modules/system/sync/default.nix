{
  den.aspects.sync = {
    nixos = {
      services.syncthing = {
        enable = true;
        overrideDevices = false;
        overrideFolders = true;
      };
    };
  };

  den.aspects.rafael.nixos.services.syncthing = let
    user = "rafael";
    home = "/home/${user}";
  in {
    inherit user;
    dataDir = "${home}/.local/state/syncthing";
    configDir = "${home}/.config/syncthing";
    settings.folders = {
      "Documents".path = "${home}/Documents";
      "Music".path = "${home}/Music";
      "Pictures".path = "${home}/Pictures";
    };
  };
}
