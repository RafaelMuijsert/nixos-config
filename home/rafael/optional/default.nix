{
  inputs,
  pathUtils,
  ...
}: {
  home-manager.users.rafael = {
    imports = builtins.concatMap (dir: pathUtils.readDirectory dir) [
      ./desktops
      ./environment
      ./programs
      ./themes
      ./wms/i3
    ];
  };
}
