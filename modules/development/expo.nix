{ den, ... }:
{
  den.ful.development.expo = {
    includes = [ den.aspects.development.typescript ];
    nixos = {
      networking.firewall.allowedTCPPorts = [ 8081 ];
    };
  };
}
