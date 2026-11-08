{ den, ... }:
{
  den.ful.music.rmpc = {
    includes = [ den.aspects.mpd ];
    homeManager.programs.rmpc = {
      enable = true;
    };
  };
}
