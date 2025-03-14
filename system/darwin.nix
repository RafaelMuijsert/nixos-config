{
  pathUtils,
  pkgs,
  ...
}: {
  imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
    ./options
    ./packages
  ];
}
