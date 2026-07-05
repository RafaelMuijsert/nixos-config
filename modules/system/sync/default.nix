# TODO: fix this
let
  homeDirectory = "/home/rafael";
in {
  den.aspects.sync = {
    nixos = {
      services.syncthing = {
        enable = true;
        overrideDevices = false;
        overrideFolders = true;

        # TODO: do this properly
        user = "rafael";
        dataDir = "${homeDirectory}/.local/state/syncthing";
        configDir = "${homeDirectory}/.config/syncthing";
        settings.folders = {
          "Documents" = {
            path = "${homeDirectory}/Documents";
          };
          "Music" = {
            path = "${homeDirectory}/Music";
          };
          "Pictures" = {
            path = "${homeDirectory}/Pictures";
          };
        };
      };
    };
  };
}
