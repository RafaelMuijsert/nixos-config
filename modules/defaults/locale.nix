{ config, ... }:
{
  den.default.nixos.i18n.defaultLocale = "en_US.UTF-8";
  den.default.nixos.time.timeZone = config.timezone;
}
