{
  pkgs,
  home-manager,
  ...
}: {
  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
