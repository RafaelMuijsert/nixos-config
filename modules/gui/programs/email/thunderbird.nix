{
  den.ful.email.thunderbird.homeManager = {
    programs.thunderbird = {
      enable = true;
      profiles = {
        Primary = {
          isDefault = true;
          feedAccounts = {
            Feeds = { };
          };
          accountsOrder = [
            "Primary"
            "Student"
            "Work"
            "Feeds"
          ];
        };
      };
      settings = {
        "network.dns.disableIPv6" = true;
      };
    };
  };
}
