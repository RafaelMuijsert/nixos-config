{ inputs, den, ... }:
{

  den.aspects.elite.includes = [ (den.batteries.tty-autologin "rafael") ];

  perSystem =
    { pkgs, ... }:
    {
      packages.vm = pkgs.writeShellApplication {
        name = "vm";
        text =
          let
            host = inputs.self.nixosConfigurations.elite.config;
          in
          ''
            ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
          '';
      };
    };
}
