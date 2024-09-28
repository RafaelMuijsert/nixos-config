{
  lib,
  config,
  osConfig,
  pathUtils,
  ...
}: {
  imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
    ./environment
    ./i3
    ./login
    ./status
    ./programs
  ];
}
