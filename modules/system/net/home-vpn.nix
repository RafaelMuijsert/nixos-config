{ __findFile ? __findFile, lib, ... }:
let
  wg = {
    interface = "wg0";
    port = 51820;
    mtu = 1386;
  };

  network = {
    prefix = "192.168.100";
    cidr = 24;
    dns = "192.168.42.2";
    externalInterface = "ens18";
  };

  hostIP = host: "${network.prefix}.${toString host}";
  hostCIDR = host: "${hostIP host}/${toString network.cidr}";

  server = {
    host = "infra";
    endpoint = "vpn.muijsert.org";
    publicKey = "zl1uvtjHGE85d6VcISlTbOc1W7ragmhdPcdJqnDBTx0=";

    ip = hostCIDR 1;
    allowedIPs = [ "192.168.42.0/24" ];
  };

  clients = {
    elite = {
      host = 2;
      publicKey = "Rp9VTJme+NszS53Ij/d69/eoCjnGuSC5Mcs1hKJXL1Q=";
      machine = "elite";
    };

    aorus = {
      host = 3;
      publicKey = "HUwvFF4XTPGiQgpWeoT9Vh7D47hUrXk2MHiS5/0S7As=";
      machine = "aorus";
    };

    iphone = {
      host = 4;
      publicKey = "aIIPQWeumBE5HvC9bc15IATrfRr6cEBLql2OKgU6iWk=";
    };
  };

  serverPeer = {
    inherit (server) publicKey allowedIPs;
    endpoint = "${server.endpoint}:${toString wg.port}";
  };

  clientPeers = builtins.mapAttrs (_: client: {
    inherit (client) publicKey;
    allowedIPs = [ "${hostIP client.host}/32" ];
  }) clients;

  nixosClients = lib.filterAttrs (_:client : client ? machine) clients;

  mkClient = name: _: {
    nixos = { config, ... }: {
      networking.wireguard.interfaces.${wg.interface} = {
        ips = clientPeers.${name}.allowedIPs;
        privateKeyFile = config.sops.secrets."vpn-clients/${name}".path;
        peers = [ serverPeer ];
      };
    };
  };
in
{
  den = {
    ful.net.home-vpn = {
      includes = [ <sops> ];
      nixos = { host, ... }: {
        services.resolved.enable = true;
        networking = {
          wireguard = {
            enable = true;
            interfaces.${wg.interface} = with wg; {
              inherit mtu;
            };
          };
          nameservers = [ network.dns ];
          networkmanager.dns = "systemd-resolved";
          nat.enable = host.name == server.host;
        };
      };
    };

    aspects = (builtins.mapAttrs mkClient nixosClients) // {
      ${server.host}.nixos = { config, ... }: {
        networking = {
          wireguard.interfaces.${wg.interface} = {
            ips = [ server.ip ];
            listenPort = wg.port;
            peers = clientPeers;
            privateKeyFile = config.sops.secrets."vpn-server/key".path;
          };
          nat = with network; {
            inherit externalInterface;
            internalInterfaces = [ wg.interface ];
          };
          firewall.allowedUDPPorts = [ wg.port ];
        };
      };
    };
  };
}
