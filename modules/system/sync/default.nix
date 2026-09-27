let
  coreID = "37VH62T-5UP3BSB-OKYPGOY-IGXFVFU-DHXXQQ3-3GW6INY-YTQJJYR-XXXGEQB";
  aorusID = "FSFRLFB-FPC2GX6-H34V4YQ-ZS5FJ3M-NT6IZF5-567G3JA-CHBDLUN-TTCUUAN";
  eliteID = "OSGHMZK-KYEI6ET-F7B6GBM-5B4FBU2-U5LA4J4-T5KIRBY-PPPW3UX-5AZD4AS";
in
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

  den.aspects.rafael =
    let
      user = "rafael";
      home = "/home/${user}";
    in
    {
      nixos = { config, host, ... }: {
        services.syncthing = {
          inherit user;
          dataDir = "${home}/.local/state/syncthing";
          configDir = "${home}/.config/syncthing";
          key = config.sops.secrets."syncthing-hosts/${host.hostName}/key".path;
          cert = config.sops.secrets."syncthing-hosts/${host.hostName}/cert".path;
          settings.devices = {
            core.id = coreID;
            elite.id = eliteID;
            aorus.id = aorusID;
          };
          settings.folders = {
            "Documents" = {
              path = "${home}/Documents";
              devices = [ "core" "elite" "aorus" ];
            };
            "Music" = {
              path = "${home}/Music";
              devices = [ "core" "elite" "aorus" ];
            };
            "Pictures" = {
              path = "${home}/Pictures";
              devices = [ "core" "elite" "aorus" ];
            };
          };
        };
      };
    };
}
