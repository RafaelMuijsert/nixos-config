{ __findFile, inputs, ... }:
let
  port = 8392;
  name = "calendar";
in

{
  flake-file.inputs = {
    oxicale.url = "github:RafaelMuijsert/oxicale";
    oxicale.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.ful.services.${name} = {
    includes = [ <sops> ];
    webServices.internal.${name}.port = port;
    nixos = { config, ... }: {
      sops.secrets.oxicale-credentials.owner = config.services.oxicale.user;
      imports = [ inputs.oxicale.nixosModules.default ];
      services.oxicale = {
        enable = true;
        settings = {
          server = {
            bind = [ "127.0.0.1:${toString port}" ];
          };
          auth = {
            backend = "local";
            password_file = config.sops.secrets.oxicale-credentials.path;
          };
        };
      };
    };
  };
}
