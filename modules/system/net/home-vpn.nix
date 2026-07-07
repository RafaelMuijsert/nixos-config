# WireGuard VPN client configuration. Provides a shared base definition
# (den.ful.net.home-vpn) that any host can include, plus host-specific
# settings for the 'elite' laptop (private key from SOPS, static IP).
let
  publicKey = "zl1uvtjHGE85d6VcISlTbOc1W7ragmhdPcdJqnDBTx0=";
  allowedIPs = [ "192.168.42.0/24" ];
  endpoint = "vpn.muijsert.org:51820";
  interface = "wg0";
in
{
  # Shared VPN peer configuration for all clients
  den.ful.net.home-vpn = {
    nixos.networking = {
      # Use local DNS server
      networkmanager = {
        dns = "none";
        insertNameservers = [ "192.168.42.2" ];
      };

      wireguard = {
        enable = true;
        interfaces.${interface} = {
          peers = [
            {
              inherit publicKey allowedIPs endpoint;
            }
          ];
        };
      };
    };
  };
  # Elite-specific: static VPN IP + private key from SOPS secrets
  den.aspects.elite.nixos = { config, ... }: {
    networking.wireguard.interfaces.${interface} = {
      ips = [ "192.168.100.2/32" ];
      privateKeyFile = config.sops.secrets."vpn-clients/elite".path;
    };
  };

  den.aspects.aorus.nixos = { config, ... }: {
    ips = [ "192.168.100.3/32" ];
    privateKeyFile = config.sops.secrets."vpn-clients/aorus".path;
  };
}
