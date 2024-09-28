{
  pkgs,
  path-utils,
  ...
}: {
  imports = builtins.concatMap (dir: path-utils.readDirectory dir) [
    ./desktops
  ];
}
