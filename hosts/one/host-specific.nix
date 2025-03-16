{ config, inputs, pkgs, pkgs-unstable, ... }:
let
  vpnPort = 12996;  
in {
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
    firewall.allowedUDPPorts = [ vpnPort ];

    nat = {
      enable = true;
      externalInterface = "enp4s0";
      internalInterfaces = [ "wg0" ];
    };

    wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          ips = [ "192.168.100.1/24" ];
          listenPort = vpnPort;
          privateKeyFile = config.sops.secrets."vpn-server-key".path;


          postSetup = ''
            ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o enp4s0 -j MASQUERADE
          '';

          postShutdown = ''
            ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 192.168.100.0/24 -o enp4s0 -j MASQUERADE
          '';

          peers = [
            {
              publicKey = "Rp9VTJme+NszS53Ij/d69/eoCjnGuSC5Mcs1hKJXL1Q=";
              allowedIPs = [ "192.168.100.2/32" ];
            }
          ];
        };
      };
    };
  };

  # Immich
  services.immich = {
    enable = true;
    mediaLocation = "/mnt/data/Photos/";
    package = pkgs-unstable.immich;
    port = 2283;
    settings = {
      server.externalDomain = "https://photos.muijsert.org";
    };
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
    recommendedProxySettings = true;
    virtualHosts = {
      "muijsert.org" = {
        enableACME = true;
        forceSSL = true;

        locations."/".proxyPass = "http://localhost:3000";

        serverName = "muijsert.org";
        serverAliases = [
          "www.muijsert.org"
        ];
      };
      "photos.muijsert.org" = {
        enableACME = true;
        forceSSL = true;

        locations."/" = {
          proxyPass = "http://localhost:2283";
          proxyWebsockets = true;
        };

        serverName = "photos.muijsert.org";
      };
    };
  };

  system.stateVersion = "24.11";
}


