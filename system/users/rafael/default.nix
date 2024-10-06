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
    dataDir = "/home/rafael/.local/state/syncthing";
    configDir = "/home/rafael/.config/syncthing";
    settings.folders = {
      "Documents" = {
        path = "/home/rafael/Documents";
        devices = ["one"];
      };
      "Music" = {
        path = "/home/rafael/Music";
        devices = ["one"];
      };
      "Pictures" = {
        path = "/home/rafael/Pictures";
        devices = ["one"];
      };
    };
  };
}
