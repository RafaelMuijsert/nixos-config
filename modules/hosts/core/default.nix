{ __findFile, ... }:
let
  hostname = "core";
in
{
  # Define host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
  };

  den.aspects.${hostname} = {
    includes = [
      <net/ssh>
      <sync>

      <services/actual>
      <services/immich>
      <services/jellyfin>
      <services/lidarr>
      <services/memos>
      <services/nginx>
      <services/paperless>
    ];
  };
}
