{
  config,
  options,
  pkgs,
  home-manager,
  ...
}: let
  homeDirectory = "/home/rafael";
in {
  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
    home = homeDirectory;
  };
  programs.fish.enable = true;

  # Configuration for optional file synchronization.
  services.syncthing = {
    user = "rafael";
    dataDir = "${homeDirectory}/.local/state/syncthing";
    configDir = "${homeDirectory}/.config/syncthing";
    settings.folders = {
      "Documents" = {
        path = "${homeDirectory}/Documents";
      };
      "Music" = {
        path = "${homeDirectory}Music";
      };
      "Pictures" = {
        path = "${homeDirectory}/Pictures";
      };
    };
  };
}
