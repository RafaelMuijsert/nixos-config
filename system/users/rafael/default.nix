{
  pkgs,
  home-manager,
  ...
}: {
  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
