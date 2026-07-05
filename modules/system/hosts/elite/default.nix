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

  # TODO: fix this; shouldn't be required
  den.aspects.rafael.includes = [
    <desktop/niri>
  ];

  /* Host configuration */
  den.aspects.${hostname}.includes = [
    <desktop/niri>
    <hardware/bluetooth>
    <hardware/fingerprint>
    <hardware/secureboot>
    <stylix>
  ];
}
