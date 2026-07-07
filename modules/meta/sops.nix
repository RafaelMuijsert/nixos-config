# SOPS-NIX integration: manages encrypted secrets via age encryption.
# Host SSH keys are used for automatic decryption at boot time.
# Secrets are stored in secrets.yaml (encrypted) in the repo root.
{ inputs, ... }:
{
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.default.nixos = {
    imports = [ inputs.sops-nix.nixosModules.sops ];
    sops = {
      defaultSopsFile = ../../secrets.yaml;
      age = {
        # Use the host's SSH host key for decryption
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        # Fallback key file (auto-generated if missing)
        keyFile = "/var/lib/sops-nix/key.txt";
        generateKey = true;
      };
      secrets = {
        # WireGuard server private key
        "vpn-server/key" = { };

        # WireGuard client keys
        "vpn-clients/elite" = { };

        # Syncthing device identities (3 hosts)
        "syncthing-hosts/aorus/key" = { };
        "syncthing-hosts/aorus/cert" = { };

        "syncthing-hosts/elite/key" = { };
        "syncthing-hosts/elite/cert" = { };

        "syncthing-hosts/one/key" = { };
        "syncthing-hosts/one/cert" = { };
      };
    };
  };
}
