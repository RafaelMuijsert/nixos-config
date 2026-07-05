{ __findFile, ... }:
{
  den.ful.desktops.niri = {
    includes = [
      /* Window manager */
      <wms/niri>      
      /* Shell */
      <noctalia>
      /* Browser */
      <firefox>
      /* Terminal Emulator */
      <kitty>
      /* Email Client */
      <thunderbird>
      /* Video Player */
      <mpv>
      /* Image Viewer */
      <imv>
      /* Music Player */
      <rmpc>
    ];
  };
}
