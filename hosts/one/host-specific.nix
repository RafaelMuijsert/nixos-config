{ inputs, pkgs, ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Use NetworkManager for networking.
  networking = {
    hostName = "one";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 80 443 ];
  };

  # Portfolio website
  systemd.services.portfolio = {
    description = "Portfolio Website";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      WorkingDirectory = "${inputs.portfolio.packages.x86_64-linux.default}/lib/node_modules/portfolio";
      ExecStart = "${pkgs.nodePackages_latest.npm}/bin/npm run start";
      Restart = "always";
      Environment = "PATH=${pkgs.bash}/bin";
    };
  };

  # SSL
  security.acme = {
    acceptTerms = true;
    defaults.email = "rafael@muijsert.org";
  };

  # Reverse proxy
  services.nginx = {
    enable = true;
    virtualHosts = {
      "muijsert.org" = {
        enableACME = true;
        forceSSL = true;

        locations."/".proxyPass = "http://localhost:3000";
        serverAliases = [
          "www.muijsert.org"
        ];
      };
    };
  };

  system.stateVersion = "24.11";
}
