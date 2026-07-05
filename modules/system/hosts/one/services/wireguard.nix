{
  config,
  pkgs,
  ...
}: let
  externalInterface = "enp4s0";
  vpnPort = 51820;
  vpnSubnet = "192.168.100.0/24";
  vpnServerIP = "192.168.100.1/24";
  vpnPeers = [
    {
      publicKey = "Rp9VTJme+NszS53Ij/d69/eoCjnGuSC5Mcs1hKJXL1Q=";
      allowedIPs = ["192.168.100.2/32"];
    }
  ];
in {
  networking = {
    wireguard = {
      enable = true;
      interfaces.wg0 = {
        ips = [vpnServerIP];
        mtu = 1280;
        listenPort = vpnPort;
        privateKeyFile = config.sops.secrets."vpn-server-key".path;

        postSetup = ''
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING \
            -s ${vpnSubnet} -o ${externalInterface} -j MASQUERADE
        '';
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
      internalInterfaces = ["wg0"];
    };
    firewall.allowedUDPPorts = [vpnPort];
  };
}
