{
  inputs,
  pkgs,
  ...
}:
let
  portfolioPort = 3000;
  portfolioDomain = "muijsert.org";
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

    PrivateUsers = true;
    RestrictNamespaces = true;

    LockPersonality = true;
    RestrictRealtime = true;
    UMask = "0077";
  };
in
{
  # Portfolio website
  systemd.services.portfolio = {
    description = "Portfolio Website";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = hardening // {
      ExecStart = "${inputs.portfolio.packages.x86_64-linux.default}/bin/portfolio";
      Restart = "on-failure";
      RestartSec = "5s";
      DynamicUser = true;
      StateDirectory = "portfolio";
      Environment = [
        "PATH=${pkgs.bash}/bin"
        "HOME=/var/lib/portfolio"
      ];
    };
  };

  services.nginx.virtualHosts."${portfolioDomain}" = {
    enableACME = true;
    forceSSL = true;
    serverAliases = [ "www.${portfolioDomain}" ];
    locations."/".proxyPass = "http://127.0.0.1:${builtins.toString portfolioPort}";
  };
}
