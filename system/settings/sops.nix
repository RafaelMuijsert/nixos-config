{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      # keyFile = "/home/rafael/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets = {
      "syncthing-hosts/aorus/key" = {};
      "syncthing-hosts/aorus/cert" = {};
    };
  };
}
