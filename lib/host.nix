{
  mkHost = {
    # The name of the system as specified in the directory structure.
    # This does not set the networking hostname.
    name,
    # System to use (e.g.: x86_64-linux)
    system,
    # List of users to be present on the given host.
    users,
    # Flake inputs.
    inputs,
    # Flake outputs.
    outputs
  }: let
    pathUtils = import ./path-utils.nix;
    resolvePath = path: ../. + "/${path}";
    specialArgs = {
      inherit pathUtils;
      inherit resolvePath;
      inherit inputs;
      inherit outputs;
    };
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;

      modules =
        [
          inputs.home-manager.nixosModules.home-manager
          {home-manager.extraSpecialArgs = specialArgs;}

          inputs.stylix.nixosModules.stylix
        ]
        ++ builtins.map (
          path: resolvePath path
        ) [
          # Hardware configuration of the host.
          "hosts/${name}/hardware-configuration.nix"
          # Host-specific system options.
          "hosts/${name}/host-specific.nix"
          # System configuration.
          "system/"
          # Tests to ensure configuration validity.
          "tests"
        ]
        ++ builtins.concatMap (
          # For each user in the configuration.
          user:
            builtins.map resolvePath [
              # Creation of the user.
              "system/users/${user}"
              # Configuration of the user.
              "home/${user}/"
              # Host-specific configuration for this user.
              "hosts/${name}/${user}.nix"
            ]
        )
        users;
    };
}
