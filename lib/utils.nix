{
  mkHost = { hostname, users }: [
    ../hosts/${hostname}/hardware-configuration.nix
    ../hosts/${hostname}/host-specific.nix

    ../system/core
    
    ../tests
  ] ++ builtins.concatMap(user:
    [
      ../system/users/${user}
      ../home/${user}/common/core
      ../home/${user}/${hostname}.nix
    ]
  ) users;
}
