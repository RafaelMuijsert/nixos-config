{ den, ... }:
{
  den.default.nixos.networking.networkmanager.enable = true;
  den.default.includes = [ den.batteries.hostname ];
}
