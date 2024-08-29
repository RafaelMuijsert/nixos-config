{ lib, ... }:
{
  programs.kitty = {
    enable = lib.mkDefault false;
  };
}
