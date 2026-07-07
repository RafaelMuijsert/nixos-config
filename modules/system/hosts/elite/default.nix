{ __findFile, ... }:
let
  hostname = "elite";
in
{
  # Host definition: creates an NixOS configuration for x86_64-linux
  # with the 'rafael' user under the 'elite' hostname.
  # Theme is set here so Stylix can apply Catppuccin Mocha globally.
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
    theme = {
      scheme = ../../../theme/catppuccin/scheme.yaml;
      polarity = "dark";
      wallpaper = ../../../theme/catppuccin/wallpaper.png;
    };
  };

  # Aspect composition: each angle-bracket include pulls in a
  # self-contained module from the modules/ tree.
  den.aspects.${hostname} = {
    includes = [
      # Desktop environment — niri WM + noctalia shell + core GUI apps
      <desktop/niri>
      <theme/catppuccin>

      # Hardware support — Bluetooth, fingerprint reader, Secure Boot, power management
      <hardware/bluetooth>
      <hardware/fingerprint>
      <hardware/secureboot>
      <hardware/upower>

      # WireGuard VPN client — connects to home VPN server
      <net/home-vpn>

      # Syncthing — 3-way sync between elite, aorus, and one
      <sync>
    ];
  };
}
