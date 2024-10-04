{ lib, config, ... }:
{
  programs.fuzzel.settings = {
    main = {
      placeholder = "\"Quick Search\"";
      # prompt = "";
      dpi-aware = lib.mkForce "yes";
    };
  };
}
