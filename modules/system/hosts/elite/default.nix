{ __findFile, ... }:
let
  /* Host info */
  hostname = "elite";
in
{
  /* Define host with users */
  den.hosts.x86_64-linux.${hostname}.users = {
    rafael = {};
  };

  den.aspects.rafael.includes = [
    <desktops/niri>
  ];

  /* Host configuration */
  den.aspects.${hostname}.includes = [
    <desktops/niri>
    <hardware/bluetooth>
    <hardware/fingerprint>
  ];
}
