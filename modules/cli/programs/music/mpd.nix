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
