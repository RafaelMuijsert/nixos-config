{
  pkgs,
  pathUtils,
  ...
}: {
  imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
    ./desktops
  ];
}
