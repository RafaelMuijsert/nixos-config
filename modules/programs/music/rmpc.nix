{ __findFile, ... }:
{
  den.ful.music.rmpc = {
    includes = [ <mpd> ];
    homeManager.programs.rmpc = {
      enable = true;
    };
  };
}
