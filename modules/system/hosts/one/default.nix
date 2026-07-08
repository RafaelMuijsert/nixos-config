let
  hostname = "one";
in {
  # Define host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
  };

  den.aspects.${hostname} = {
    includes = [];
  };
}
