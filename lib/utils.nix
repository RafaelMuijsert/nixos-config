{
  mkHost = {
    hostname,
    users,
  }:
    [
      ../hosts/${hostname}/hardware-configuration.nix
      ../hosts/${hostname}/host-specific.nix

      ../system/core
      ../system/optional

      ../tests
    ]
    ++ builtins.concatMap (
      user: [
        ../system/users/${user}

        ../home/${user}/core
        ../home/${user}/optional

        ../home/${user}/${hostname}.nix
      ]
    )
    users;
}
