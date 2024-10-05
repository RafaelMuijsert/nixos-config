{
  config,
  pkgs,
  home-manager,
  ...
}: {
  sops.secrets.password-rafael.neededForUsers = true;
  users.mutableUsers = false;

  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.password-rafael.path;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
