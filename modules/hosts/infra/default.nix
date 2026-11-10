{ den, ... }:
let
  hostname = "infra";
in
{
  # Define host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
  };

  den.aspects.${hostname} = {
    includes = with den.aspects; [
      net.ssh
      net.home-vpn
      # services.status
    ];
  };
}
