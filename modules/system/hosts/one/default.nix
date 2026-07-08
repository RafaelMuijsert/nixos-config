{ __findFile, ... }:
let
  hostname = "one";
in {
  # Define host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
  };

  den.aspects.${hostname} = {
    includes = [
      <net/ssh>
      <services/pinmedown>
      <services/snackvalue>
      <services/immich>
      <services/nginx>
      <services/wireguard>
    ];
  };
}
