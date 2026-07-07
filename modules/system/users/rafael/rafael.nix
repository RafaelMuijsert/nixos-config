# User aspect definition for Rafael. Composes den batteries to:
#   1. Create the user account (define-user)
#   2. Grant wheel + network group membership (primary-user)
#   3. Set fish as the default shell at both OS and home-manager levels
#   4. Forward host aspects to home-manager (host-aspects)
{ den, ... }:
{
  den.aspects.rafael = {
    description = "Rafael Alexander Muijsert";
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
      den.batteries.host-aspects
    ];
  };
}
