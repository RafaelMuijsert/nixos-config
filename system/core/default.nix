{pathUtils, ...}: {
  imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
    ./packages
    ./settings
  ];
}
