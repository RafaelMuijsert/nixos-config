{inputs, ...}: {
  mkHost = {
    # The name of the system as specified in the directory structure.
    # This does not set the networking hostname.
    name,
    # System to use (e.g.: x86_64-linux)
    system,
    # Package source for the base nixosSystem.
    base,
    # List of users to be present on the given host.
    users,
  }: let
    resolvePath = path: ../. + "/${path}";
    path-utils = import ./path-utils.nix;
  in
    base.lib.nixosSystem {
      inherit system;
      specialArgs = {
        nixpkgs-stable = import inputs.nixpkgs-stable {inherit system;};
        nixpkgs-unstable = import inputs.nixpkgs-unstable {inherit system;};
        firefox-addons = inputs.firefox-addons.packages.${system};

        inherit inputs;

        inherit path-utils;
      };
      modules =
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
              # # certain options/programs are enabled in the user configuration.
              "home/${user}/optional"
              # Host-specific configuration for this user.
              "hosts/${name}/${user}.nix"
            ]
        )
        users;
    };
}
