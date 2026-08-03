{ pkgs, ... }:
{
  git-hooks.hooks.statix = {
    enable = true;
    name = "Statix";
    entry = "${pkgs.statix}/bin/statix check";
  };
}
