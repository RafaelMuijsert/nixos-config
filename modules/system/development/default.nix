{ __findFile, ... }:
{
  den.ful.development.base = {
    includes = [
      <development/cxx>
      <development/devenv>
      <development/gh>
      <development/opencode>
    ];
  };
}
