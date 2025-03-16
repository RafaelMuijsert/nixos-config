{
  services.syncthing = {
    # https://github.com/NixOS/nixpkgs/issues/326704
    overrideDevices = false;
    overrideFolders = true;
  };
}
