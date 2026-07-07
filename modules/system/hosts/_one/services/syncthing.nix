{
  config,
  lib,
  ...
}:
let
  syncthingPort = 8384;
  syncthingDevices = {
    elite = {
      id = "OSGHMZK-KYEI6ET-F7B6GBM-5B4FBU2-U5LA4J4-T5KIRBY-PPPW3UX-5AZD4AS";
    };
    aorus = {
      id = "FSFRLFB-FPC2GX6-H34V4YQ-ZS5FJ3M-NT6IZF5-567G3JA-CHBDLUN-TTCUUAN";
    };
  };
  syncthingSharedFolders = [
    "Documents"
    "Music"
    "Pictures"
  ];
in
{
  # Syncthing relay on the home server. Shares Documents, Music, and
  # Pictures with all other hosts. Device identity keys are stored in SOPS.
  # Web GUI is bound to localhost only and accessed via SSH tunnel.
  services.syncthing = {
    enable = true;
    guiAddress = "127.0.0.1:${builtins.toString syncthingPort}";
    key = config.sops.secrets."syncthing-hosts/one/key".path;
    cert = config.sops.secrets."syncthing-hosts/one/cert".path;
    settings = {
      devices = syncthingDevices;
      folders = lib.genAttrs syncthingSharedFolders (_: {
        devices = builtins.attrNames syncthingDevices;
      });
    };
  };
}
