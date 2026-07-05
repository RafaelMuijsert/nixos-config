{ __findFile, ... }:
{
  den.ful.desktop.niri = {
    includes = [
      <wm/niri>      
      <shell/noctalia>
      <audio/pipewire>
      <browser/firefox>
      <terminal/kitty>
      <email/thunderbird>
      <video/mpv>
      <image/imv>
      <music/rmpc>
    ];
  };
}
