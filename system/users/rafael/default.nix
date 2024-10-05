{
  config,
  options,
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

  # Configuration for optional file synchronization.
  services.syncthing = {
    user = "rafael";
    dataDir = "/home/rafael/Data";
    configDir = "/home/rafael/Config";
    settings.folders = {
      "Documents" = {
        path = "/home/rafael/Documents";
        devices = [ "one" ];
      };
      "Music" = {
        path = "/home/rafael/Music";
        devices = [ "one" ];
      };
      "Pictures" = {
        path = "/home/rafael/Pictures";
        devices = [ "one" ];
      };
    };
  };
}
