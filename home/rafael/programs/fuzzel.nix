{ lib, ... }:
{
  programs.fuzzel.settings = {
    main = {
      prompt = "Type to search: ";
      dpi-aware = "no";
    };
  };
}
