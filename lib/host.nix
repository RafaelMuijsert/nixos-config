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
    specialArgs = {
      inherit inputs;
      inherit pathUtils;
      inherit resolvePath;
      pkgs-unstable = import inputs.nixpkgs-unstable {inherit system;};
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
          inputs.sops-nix.nixosModules.sops
        ]
        ++ builtins.map (
          path: resolvePath path
        ) [
          # Hardware configuration of the host.
          "hosts/${name}/hardware-configuration.nix"
          # Host-specific system options.
          "hosts/${name}/host-specific.nix"
          # System configuration.
          "system/linux.nix"
          # Tests to ensure configuration validity.
          "tests"
        ]
        ++ builtins.concatMap (
          # For each user in the configuration.
          user:
            builtins.map resolvePath [
              # Creation of the user.
              "system/users/${user}/linux.nix"
              # Configuration of the user.
              "home/${user}/linux.nix"
              # Host-specific configuration for this user.
              "hosts/${name}/${user}.nix"
            ]
        )
        users;
    };
  mkDarwinHost = {
    # The name of the system as specified in the directory structure.
    # This does not set the networking hostname.
    name,
    # System to use (e.g.: aarch64-darwin)
    system,
    # List of users to be present on the given host.
    users,
    # Flake inputs.
    inputs,
  }: let
    pathUtils = import ./path-utils.nix;
    resolvePath = path: ../. + "/${path}";
    specialArgs = {
      inherit inputs;
      inherit pathUtils;
      inherit resolvePath;
      pkgs-unstable = import inputs.nixpkgs-unstable {inherit system;};
    };
  in
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      inherit specialArgs;

      modules =
        [
          inputs.home-manager.darwinModules.home-manager
          {home-manager.extraSpecialArgs = specialArgs;}

          inputs.sops-nix.darwinModules.sops
        ]
        ++ builtins.map (
          path: resolvePath path
        ) [
          # Host-specific system options.
          "hosts/${name}/host-specific.nix"
          # System configuration.
          "system/darwin.nix"
          # Tests to ensure configuration validity.
          # "tests"
        ]
        ++ builtins.concatMap (
          # For each user in the configuration.
          user:
            builtins.map resolvePath [
              # Creation of the user.
              "system/users/${user}/darwin.nix"
              # Configuration of the user.
              "home/${user}/darwin.nix"
              # Host-specific configuration for this user.
              # "hosts/${name}/${user}.nix"
            ]
        )
        users;
    };
}
