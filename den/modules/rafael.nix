{ den, ... }:
{
  den.aspects.rafael = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];
  };
}
