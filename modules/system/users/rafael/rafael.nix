{ den, ... }:
{
  den.aspects.rafael = {
    description = "Rafael Alexander Muijsert";
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];
  };
}
