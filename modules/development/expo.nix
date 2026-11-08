{ __findFile, ... }:
{
  den.ful.development.expo = {
    includes = [ <development/typescript> ];
    nixos = {
      networking.firewall.allowedTCPPorts = [ 8081 ];
    };
  };
}
