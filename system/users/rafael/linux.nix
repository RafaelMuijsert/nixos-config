{
  config,
  options,
  pkgs,
  home-manager,
  ...
}: {

  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
    home = "/home/rafael";
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
      };
      "Music" = {
        path = "/home/rafael/Music";
      };
      "Pictures" = {
        path = "/home/rafael/Pictures";
      };
    };
  };
}
