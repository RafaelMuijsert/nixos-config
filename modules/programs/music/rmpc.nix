{ den, ... }:
{
  den.aspects.music.rmpc = {
    includes = [ den.aspects.mpd ];
    homeManager.programs.rmpc = {
      enable = true;
    };
  };
}
