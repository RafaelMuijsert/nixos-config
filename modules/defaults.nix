{ lib, den, ... }:
{
  # Default system state version
  den.default.nixos.system.stateVersion = "26.05";
  den.default.homeManager.home.stateVersion = "26.05";

  # Enable home-manager by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
