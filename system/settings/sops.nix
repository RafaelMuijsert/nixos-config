{config, ...}: {
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      "syncthing-hosts/aorus/key" = {};
      "syncthing-hosts/aorus/cert" = {};

      "syncthing-hosts/elite/key" = {};
      "syncthing-hosts/elite/cert" = {};
    };
  };
}
