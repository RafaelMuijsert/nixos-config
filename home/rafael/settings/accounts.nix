{
  accounts = {
    email.accounts = {
      Primary = {
        address = "rmuijsert@gmail.com";
        flavor = "gmail.com";
        primary = true;
        realName = "Rafael Alexander Muijsert";

        thunderbird = {
          enable = true;
          # Required for OAuth.
          settings = id: {
            "mail.smtpserver.smtp_${id}.authMethod" = 10;
            "mail.server.server_${id}.authMethod" = 10;
          };
        };
      };
    };
  };
}
