{ __findFile, ... }:
{
  den.aspects.rafael = {
    includes = [ <sops> ];
    nixos.sops.secrets.radicale-credentials = { };

    provides.to-hosts.homeManager = { config, ... }: {
      accounts.calendar.accounts.Personal = {
        primary = true;
        remote = {
          url = "https://calendar.internal.muijsert.org/rafael/4de19276-b4f9-e212-95ed-03cd9e1d2fa4/";
          userName = "rafael";
          type = "caldav";
          passwordCommand = [
            "cat"
            config.sops.secrets.radicale-credentials.path
          ];
        };
        thunderbird.enable = true;
      };
    };
  };
}
