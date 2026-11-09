{ den, ... }:
{
  den.aspects.development.expo = {
    includes = [ den.aspects.development.typescript ];
    nixos = {
      networking.firewall.allowedTCPPorts = [ 8081 ];
    };
  };
}
