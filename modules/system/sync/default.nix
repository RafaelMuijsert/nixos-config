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
}
