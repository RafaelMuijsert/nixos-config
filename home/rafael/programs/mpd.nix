{
  services.mpd.musicDirectory = "~/Music";
  services.mpd.extraConfig = ''
    audio_output {
      type     "pulse"
      name     "pulse audio"
    }
  '';
}
