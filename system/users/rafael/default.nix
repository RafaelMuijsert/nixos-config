{
  nixpkgs-stable,
  nixpkgs-unstable,
  home-manager,
  ...
}: {
  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = nixpkgs-unstable.fish;
  };
  programs.fish.enable = true;
}
