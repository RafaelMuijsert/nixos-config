{
  inputs,
  ...
}:
let
  pinmedownPort = 9000;
  pinmedownDomain = "pinmedown.app";
  # Hardened systemd service: runs as an unprivileged DynamicUser with
  # strict filesystem isolation, restricted namespaces, and minimal
  # capabilities. This is shared across all web services on the server.
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
  flake-file.inputs = {
    pinmedown.url = "git+ssh://git@github.com/RafaelMuijsert/pinmedown-web";
    pinmedown.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.one.nixos = { pkgs, ...}: {
    systemd.services.pinmedown = {
      description = "PinMeDown Website";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = hardening // {
        ExecStart = "${inputs.pinmedown.packages.x86_64-linux.default}/bin/pinmedown-web";
        Restart = "on-failure";
        RestartSec = "5s";
        DynamicUser = true;
        StateDirectory = "pinmedown";
        Environment = [
          "PATH=${pkgs.bash}/bin"
          "PORT=${builtins.toString pinmedownPort}"
        ];
      };
    };
    services.nginx.virtualHosts."${pinmedownDomain}" = {
      enableACME = true;
      forceSSL = true;
      serverAliases = [ "www.${pinmedownDomain}" ];
      locations."/".proxyPass = "http://127.0.0.1:${builtins.toString pinmedownPort}";
    };
  };
}
