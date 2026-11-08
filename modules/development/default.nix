{ den, ... }:
{
  den.ful.development.base = {
    includes = with den.aspects.development; [
      cxx
      devenv
      gh
      opencode
    ];
  };
}
