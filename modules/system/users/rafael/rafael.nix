{ den, ... }:
{
  den.aspects.rafael = {
    description = "Rafael Alexander Muijsert";
    includes = [
      # Create user account
      den.batteries.define-user
      # Make user account a primary user (wheel and network groups)
      den.batteries.primary-user
      # Set default shell to fish (os and home-manager level)
      (den.batteries.user-shell "fish")
      # Automatically forward host home-manager configuration
      den.batteries.host-aspects
    ];
  };
}
