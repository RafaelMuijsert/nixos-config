{ inputs, ... }:
{
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.sops.nixos = {
    imports = [ inputs.sops-nix.nixosModules.sops ];
    defaultSopsFile = ../../secrets.yaml;
    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      "vpn-server/key" = {};

      "vpn-clients/elite" = {};

      "syncthing-hosts/aorus/key" = {};
      "syncthing-hosts/aorus/cert" = {};

      "syncthing-hosts/elite/key" = {};
      "syncthing-hosts/elite/cert" = {};

      "syncthing-hosts/one/key" = {};
      "syncthing-hosts/one/cert" = {};
    };
  };
}
