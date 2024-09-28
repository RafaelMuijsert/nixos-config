{inputs, path-utils,...} @ attrs: {
  home-manager.users.rafael = {
    imports = builtins.concatMap (dir: attrs.path-utils.readDirectory dir) [
      ./desktops
      ./programs
    ];
  };
}
