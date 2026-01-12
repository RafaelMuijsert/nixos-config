{
  pkgs,
  ...
}: {
  users.users.rafael = {
    description = "Rafael Alexander Muijsert";
    shell = pkgs.fish;
    home = "/Users/rafael";
  };
  programs.fish.enable = true;
}
