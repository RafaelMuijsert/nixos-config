{ __findFile, ... }:
{
  den.ful.development.base = {
    includes = [
      <development/opencode>
      <development/devenv>
    ];
  };
}
