{ __findFile, ... }:
let
  /* Host info */
  hostname = "elite";
in
{
  /* Define host with users */
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = {};
    };
    # TODO: set this automatically when importing a theme
    theme = {
      scheme = ../../../theme/catppuccin/scheme.yaml;
      polarity = "dark";
      wallpaper = ../../../theme/catppuccin/wallpaper.png;
    };
  };

  /* Host configuration */
  den.aspects.${hostname} = {
    includes = [
      /* Desktop */
      <desktop/niri>
      <theme/catppuccin>

      /* Hardware */
      <hardware/bluetooth>
      <hardware/fingerprint>
      <hardware/secureboot>
      <hardware/upower>

      /* Network */
      <net/home-vpn>

      /* Directory Sync */
      <sync>
    ];
  };
}
