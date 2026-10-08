# Full desktop composition: bundles the niri WM with noctalia shell,
# audio, and all essential GUI applications into a single import.
# Include <desktop/niri> in any host aspect to get the complete desktop.
{ __findFile, ... }:
{
  den.ful.desktop.niri = {
    includes = [
      <wm/niri>
      <shell/noctalia>

      <audio/pipewire>
      <browser/firefox>
      <terminal/kitty>
      <documents/zathura>
      <email/thunderbird>
      <video/mpv>
      <image/imv>
      <music/rmpc>

      <security/keyring>
      <security/pam>
      <security/polkit>
    ];

    homeManager = { pkgs, ...} : {
      home.packages = with pkgs; [
        signal-desktop
        telegram-desktop
      ];
    };
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.bitwarden-desktop ];
    };
  };
}
