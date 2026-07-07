{
  den.aspects.sync = {
    nixos = {
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        overrideDevices = false;
        overrideFolders = true;
      };
    };
  };

  den.aspects.rafael.nixos.services.syncthing =
    let
      user = "rafael";
      home = "/home/${user}";
    in
    {
      inherit user;
      dataDir = "${home}/.local/state/syncthing";
      configDir = "${home}/.config/syncthing";
      settings.devices = {
        one.id = "37VH62T-5UP3BSB-OKYPGOY-IGXFVFU-DHXXQQ3-3GW6INY-YTQJJYR-XXXGEQB";
        aorus.id = "FSFRLFB-FPC2GX6-H34V4YQ-ZS5FJ3M-NT6IZF5-567G3JA-CHBDLUN-TTCUUAN";
      };
      settings.folders = {
        "Documents" = {
          path = "${home}/Documents";
          devices = [
            "one"
            "aorus"
          ];
        };
        "Music" = {
          path = "${home}/Music";
          devices = [
            "one"
            "aorus"
          ];
        };
        "Pictures" = {
          path = "${home}/Pictures";
          devices = [
            "one"
            "aorus"
          ];
        };
      };
    };
}
