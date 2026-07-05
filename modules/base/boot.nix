{
  den.default.nixos.boot = {
    loader.timeout = 0;
    consoleLogLevel = 4;
    kernelParams = [ "quiet" "splash" ];
  };
}
