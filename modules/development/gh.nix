{ config, ... }:
{
  den.aspects.development.gh.homeManager.programs.gh = {
    enable = true;
    hosts."github.com".user = config.github-username;
    settings = {
      git_protocol = "ssh";
    };
  };
}
