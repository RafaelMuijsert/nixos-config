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
  }: let
    pathUtils = import ./path-utils.nix;
    resolvePath = path: ../. + "/${path}";
    specialArgs = { inherit pathUtils; inherit resolvePath; };
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;

      modules =
        [
          inputs.home-manager.nixosModules.home-manager 
          { home-manager.extraSpecialArgs = specialArgs; }
        ] 
        ++
        builtins.map (
          path: resolvePath path
        ) [
          # Hardware configuration of the host.
          "hosts/${name}/hardware-configuration.nix"
          # Host-specific system options.
          "hosts/${name}/host-specific.nix"
          # Will automatically be applied to every system.
          "system/core"
          # System configuration that does not take effect until
          # certain options/programs are enabled in the host configuration.
          "system/optional"
          # Tests to ensure configuration validity.
          "tests"
        ]
        ++ builtins.concatMap (
          # For each user in the configuration.
          user:
            builtins.map resolvePath [
              # Creation of the user.
              "system/users/${user}"
              # Will automatically be applied.
              "home/${user}/core"
              # Home configuration that does not take effect until
              # certain options/programs are enabled in the user configuration.
              "home/${user}/optional"
              # Host-specific configuration for this user.
              "hosts/${name}/${user}.nix"
            ]
        )
        users;
    };
}
