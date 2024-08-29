{ lib, osConfig, ...}:
{
  config = lib.mkIf osConfig.desktop.i3-minimal.enable {
    programs = {
      kitty.enable = true;
    };
  };
}
