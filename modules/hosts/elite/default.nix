{ den, ... }:
let
  hostname = "elite";
in
{
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
  };

  den.aspects.${hostname} = {
    includes = with den.aspects; [
      desktop.niri
      theme.catppuccin

      hardware.bluetooth
      hardware.fingerprint
      hardware.hibernate
      hardware.secureboot
      hardware.upower

      net.home-vpn

      services.sync

      development.base
      development.game
      development.expo

      documents.typst
      academia.symlink
    ];
  };
}
