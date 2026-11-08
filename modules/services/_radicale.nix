{ __findFile, ... }:
let
  port = 8392;
  name = "calendar";
in
{
  den.ful.services.${name} = {
    includes = [ <sops> ];
    webServices.internal.${name}.port = port;
    nixos = { config, ... }: {
      sops.secrets.radicale-users.owner = config.services.radicale.user;
      services.radicale = {
        enable = true;
        settings = {
          server.hosts = [ "0.0.0.0:${toString port}" ];
          auth = {
            type = "htpasswd";
            htpasswd_filename = config.sops.secrets.radicale-users.path;
            htpasswd_encryption = "plain";
          };
        };
      };
    };
  };
}
