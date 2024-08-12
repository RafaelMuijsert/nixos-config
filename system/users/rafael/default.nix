{ nixpkgs-stable, nixpkgs-unstable, ... }:
{
  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = nixpkgs-unstable.fish;
  };
  programs.fish.enable = true;
}
