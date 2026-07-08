# WireGuard VPN server running on the 'one' home server.
# Acts as a NAT gateway for VPN clients, masquerading their traffic
# onto the external interface (enp4s0). The server private key is
# stored encrypted via SOPS and decrypted at boot.
{
  pkgs,
  ...
}:
let
  externalInterface = "enp4s0";
  vpnPort = 51820;
  vpnSubnet = "192.168.100.0/24";
  vpnServerIP = "192.168.100.1/24";
  # Peers that are allowed to connect to this VPN
  vpnPeers = [
    {
      publicKey = "Rp9VTJme+NszS53Ij/d69/eoCjnGuSC5Mcs1hKJXL1Q=";
      allowedIPs = [ "192.168.100.2/32" ];
    }
    {
      publicKey = "HUwvFF4XTPGiQgpWeoT9Vh7D47hUrXk2MHiS5/0S7As=";
      allowedIPs = [ "192.168.100.3/32" ];
    }
  ];
in
{
  den.aspects.one.nixos = { config, pkgs, ... }: {
    networking = {
      wireguard = {
        enable = true;
        interfaces.wg0 = {
          ips = [ vpnServerIP ];
          listenPort = vpnPort;
          privateKeyFile = config.sops.secrets."vpn-server/key".path;

          # Set up NAT masquerading for VPN traffic
          postSetup = ''
            ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING \
              -s ${vpnSubnet} -o ${externalInterface} -j MASQUERADE
          '';
          # Tear down the masquerade rule on shutdown
          postShutdown = ''
            ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING \
              -s ${vpnSubnet} -o ${externalInterface} -j MASQUERADE
          '';

          peers = vpnPeers;
        };
      };
      nat = {
        enable = true;
        externalInterface = externalInterface;
        internalInterfaces = [ "wg0" ];
      };
      # Open the WireGuard port in the firewall
      firewall.allowedUDPPorts = [ vpnPort ];
    };
  };
}
