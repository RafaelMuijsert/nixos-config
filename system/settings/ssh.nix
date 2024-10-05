{
  services.openssh = {
    enable = true;
    hostKeys = [
      { 
        type = "ed25519";
        path = "/etc/ssh/ssh_host_ed25519_key";
      }
    ];
  };
}
