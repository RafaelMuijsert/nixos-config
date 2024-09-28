{
  inputs,
  pathUtils,
  ...
}: {
  home-manager.users.rafael = {
    imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
      ./desktops
      ./programs
    ];
  };
}
