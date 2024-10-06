{
  services.syncthing = {
    # https://github.com/NixOS/nixpkgs/issues/326704
    overrideDevices = false;
    overrideFolders = true;
    settings.devices = {
      "one" = {id = "MBKWEDD-ZKFPJL3-XPV7IVG-D04N4M7-ALQJ4BG-GNBZXNU-7ZVP3NW-VQZC0AE";};
    };
  };
}
