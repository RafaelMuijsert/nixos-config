{
  den.aspects.rafael = {
    provides.to-hosts.homeManager = {
      accounts.calendar.accounts = {
        Personal = {
          primary = true;
          remote = {
            url = "https://calendar.internal.muijsert.org/personal";
            userName = "rafael";
            type = "caldav";
          };
          thunderbird.enable = true;
        };
        Academia = {
          remote = {
            url = "https://calendar.internal.muijsert.org/academia";
            userName = "rafael";
            type = "caldav";
          };
          thunderbird.enable = true;
        };
        Work = {
          remote = {
            url = "https://calendar.internal.muijsert.org/work";
            userName = "rafael";
            type = "caldav";
          };
          thunderbird.enable = true;
        };
      };
    };
  };
}
