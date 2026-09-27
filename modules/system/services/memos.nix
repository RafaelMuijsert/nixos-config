{ config, ... }:
let
  port = 5320;
  subdomain = "memos";
in {
  den.ful.services.memos = {
    webServices.internal.${subdomain}.port = port;
    nixos = { pkgs-unstable, ... } @ cfg: {
      services.memos = {
        enable = true;
        package = pkgs-unstable.memos;
        settings = {
          MEMOS_MODE = "prod";
          MEMOS_ADDR = "127.0.0.1";
          MEMOS_DATA = cfg.config.services.memos.dataDir;
          MEMOS_PORT = toString port;
          MEMOS_DRIVE = "sqlite";
          MEMOS_INSTANCE_URL = "https://${subdomain}.internal.${config.domain}";
        };
      };
    };
  };
}
