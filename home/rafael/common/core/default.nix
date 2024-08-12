{ nixpkgs-stable, nixpkgs-unstable, home-manager, ...}:
{
  imports = [ home-manager.nixosModules.default ];
  home-manager.users.rafael = import ./home.nix {
    inherit nixpkgs-stable;
    inherit nixpkgs-unstable;
  }; # };
}
