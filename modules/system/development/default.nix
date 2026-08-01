{ __findFile, ... }:
{
  den.ful.development.base = {
    includes = [
      <development/opencode>
    ];

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        devenv
      ];
    };
  };
}
