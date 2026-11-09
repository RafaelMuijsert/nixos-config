{ den, lib, ... }:
{
  den.schema.host = {
    options.theme = lib.mkOption {
      type = lib.types.submodule {
        options = {
          scheme = lib.mkOption { type = lib.types.path; };
          polarity = lib.mkOption {
            type = lib.types.enum [
              "dark"
              "light"
            ];
          };
          wallpaper = lib.mkOption { type = lib.types.path; };
        };
      };
    };
    config.theme = lib.mkDefault (import ./_scheme.nix);
  };

  den.aspects.theme.catppuccin = {
    includes = [ den.aspects.stylix ];
  };
}
