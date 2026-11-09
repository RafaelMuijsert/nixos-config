{ den, ... }:
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
    includes = with den.aspects; [
      net.ssh

      services.sync
      services.actual
      services.calendar
      services.immich
      services.jellyfin
      services.lidarr
      services.memos
      services.nginx
      services.paperless
      services.pinmedown
    ];
  };
}
