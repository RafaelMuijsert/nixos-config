{
  inputs,
  ...
}:
let
  snackvaluePort = 9094;
  snackvalueDomain = "snackvalue.nl";
  hardening = {
    ProtectSystem = "strict";
    ProtectHome = true;
    PrivateTmp = true;
    PrivateDevices = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectKernelLogs = true;
    ProtectControlGroups = true;
    ProtectClock = true;
    ProtectHostname = true;

    NoNewPrivileges = true;
    RestrictSUIDSGID = true;
    RemoveIPC = true;

    PrivateNetwork = false; # needs loopback
    RestrictAddressFamilies = [
      "AF_INET"
      "AF_INET6"
      "AF_NETLINK"
    ];

    SystemCallArchitectures = "native";
    SystemCallFilter = [ "@system-service" ];

    CapabilityBoundingSet = "";
    AmbientCapabilities = "";

    DynamicUser = true;
    PrivateUsers = true;
    RestrictNamespaces = true;

    LockPersonality = true;
    RestrictRealtime = true;
    UMask = "0077";
  };

in
{
  flake-file.inputs = {
    snackvalue.url = "git+ssh://git@github.com/RafaelMuijsert/snackvalue";
    snackvalue.inputs.nixpkgs.follows = "nixpkgs";
  };
  den.aspects.one.nixos = { pkgs, ... }: {
    # SnackValue scraper
    systemd.services.snackvalue-scraper = {
      serviceConfig = hardening // {
        StateDirectory = "snackvalue";
        Type = "simple";
        ExecStart = "${inputs.snackvalue.packages.x86_64-linux.scraper}/bin/snackvalue-scraper";
        Environment = [
          "DB_PATH=/var/lib/snackvalue/snackvalue.db"
        ];
      };
    };
    # SnackValue
    systemd.services.snackvalue = {
      description = "SnackValue Website";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = hardening // {
        ExecStart = "${inputs.snackvalue.packages.x86_64-linux.default}/bin/snackvalue";
        Restart = "on-failure";
        RestartSec = "5s";
        StateDirectory = "snackvalue";
        Environment = [
          "PATH=${pkgs.bash}/bin"
          "DB_PATH=/var/lib/snackvalue/snackvalue.db"
          "PORT=${builtins.toString snackvaluePort}"
        ];
      };
    };

    services.nginx.virtualHosts."${snackvalueDomain}" = {
      enableACME = true;
      forceSSL = true;
      serverAliases = [ "www.${snackvalueDomain}" ];
      locations."/".proxyPass = "http://127.0.0.1:${builtins.toString snackvaluePort}";
    };
  };
}
