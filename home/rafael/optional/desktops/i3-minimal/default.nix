{
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    imports = builtins.concatMap (dir: attrs.path-utils.readDirectory dir) [
      ./environment
      ./i3
      ./login
      ./status
      ./programs
    ];
  };
}
