{ den, ... }:
{
  den.default.nixos = { pkgs, ... }: {
    networking.networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };
  den.default.includes = [ den.batteries.hostname ];
}
