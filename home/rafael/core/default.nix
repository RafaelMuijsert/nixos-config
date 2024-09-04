{
  nixpkgs-stable,
  nixpkgs-unstable,
  inputs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.default];
  home-manager.users.rafael = import ./home.nix {
     inherit nixpkgs-stable;
     inherit nixpkgs-unstable;
  };
}
