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

  /* Host configuration */
  den.aspects.${hostname}.includes = [
    <desktops/niri>
    <auth/fingerprint>
    <bluetooth>
  ];
}
