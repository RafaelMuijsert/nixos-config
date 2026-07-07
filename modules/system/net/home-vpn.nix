{ config, ... }:
let
  publicKey = "zl1uvtjHGE85d6VcISlTbOc1W7ragmhdPcdJqnDBTx0=";
  allowedIPs = ["192.168.42.0/24"];
  endpoint = "vpn.muijsert.org:51820";
in {
  den.ful.net.home-vpn = {
    nixos = {
      networking.wireguard = {
        enable = true;
        wg0 = {
          peers = [
            {
              inherit publicKey allowedIPs endpoint;
            }
          ]
        };
      };
    };
  };
  den.aspects.elite.nixos.networking.wireguard = {
    ips = ["192.168.100.2/32"];
    privateKeyFile = config.sops.secrets."vpn-clients/elite".path;
  };
}
