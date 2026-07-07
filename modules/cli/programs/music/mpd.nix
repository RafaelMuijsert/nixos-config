# Music Player Daemon: background music server with PulseAudio output.
# Music directory is ~/Music. Controlled by rmpc or any MPD client.
{
  den.aspects.mpd = {
    homeManager.services.mpd = {
      enable = true;
      musicDirectory = "~/Music";
      extraConfig = ''
        audio_output {
          type "pulse"
          name "pulse audio"
        }
      '';
    };
  };
}
