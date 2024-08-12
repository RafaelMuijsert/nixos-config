{
  mkHost = { hostname, users }: [
    ../hosts/${hostname}/hardware-configuration.nix
    ../hosts/${hostname}/host-specific.nix
    
    ../tests
  ] ++ builtins.concatMap(user:
    [
      ../system/users/${user}
    ]
  ) users;
}
