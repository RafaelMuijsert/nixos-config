{
  programs.thunderbird = {
    profiles = {
      Primary = {
        isDefault = true;
      };
    };
    settings = {
      "network.dns.disableIPv6" = true;
    };
  };
}
