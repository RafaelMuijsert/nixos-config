{ __findFile, ... }:
let
  port = 51820;
  serverIP = "192.168.100.1/24";
  subnet = "192.168.100.0/24";
  interface = "wg0";
  externalInterface = "ens18";
  mtu = 1386;
  serverPeer =
    {
      publicKey = "zl1uvtjHGE85d6VcISlTbOc1W7ragmhdPcdJqnDBTx0=";
      allowedIPs = [ "192.168.42.0/24" ];
      endpoint = "vpn.muijsert.org:${builtins.toString port}";
    };
  clientPeers = [
    {
      publicKey = "Rp9VTJme+NszS53Ij/d69/eoCjnGuSC5Mcs1hKJXL1Q=";
      allowedIPs = [ "192.168.100.2/32" ];
    }
    {
      publicKey = "HUwvFF4XTPGiQgpWeoT9Vh7D47hUrXk2MHiS5/0S7As=";
      allowedIPs = [ "192.168.100.3/32" ];
    }
    {
      publicKey = "p0IUax8yZ7U5IYWeLxjTDbmhY9u3iCtJ5DRcygtGd0Q=";
      allowedIPs = [ "192.168.100.4/32" ];
    }
  ];
in
{
  den.ful.net.home-vpn = {
    includes = [ <sops> ];
    nixos = { host, pkgs, ... }: {
      networking = {
        wireguard = {
          enable = true;
          interfaces.${interface} = {
            inherit mtu;
          };
        };
        nat.enable = host.name == "infra";
      };
    };
  };

  den.aspects.elite.nixos = { config, ... }: {
    networking.wireguard.interfaces.${interface} = {
      ips = [ "192.168.100.2/32" ];
      privateKeyFile = config.sops.secrets."vpn-clients/elite".path;
      peers = [ serverPeer ];
    };
  };

  den.aspects.aorus.nixos = { config, ... }: {
    networking.wireguard.interfaces.${interface} = {
      ips = [ "192.168.100.3/32" ];
      privateKeyFile = config.sops.secrets."vpn-clients/aorus".path;
      peers = [ serverPeer ];
    };
  };

  den.aspects.infra.nixos = { config, pkgs, ... }: {
    networking = {
      wireguard.interfaces.${interface} = {
        ips = [ serverIP ];
        listenPort = port;
        peers = clientPeers;
        privateKeyFile = config.sops.secrets."vpn-server/key".path;
        # Set up NAT masquerading for VPN traffic
        postSetup = ''
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING \
            -s ${subnet} -o ${externalInterface} -j MASQUERADE
        '';
        # Tear down the masquerade rule on shutdown
        postShutdown = ''
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING \
            -s ${subnet} -o ${externalInterface} -j MASQUERADE
        '';
      };
      nat = {
        externalInterface = externalInterface;
        internalInterfaces = [ "wg0" ];
      };
      # Open the WireGuard port in the firewall
      firewall.allowedUDPPorts = [ port ];
    };
  };
}

