{
  mkHost = hostname: [
    ../hosts/${hostname}/hardware-configuration.nix
    ../hosts/${hostname}/host-specific.nix
    ../hosts/${hostname}/users.nix

    ../tests
  ];
}
