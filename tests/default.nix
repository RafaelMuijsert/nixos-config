{ config, options, ...}:
{
  assertions = [
    {
      assertion = config.networking.hostName != options.networking.hostName.default;
      message = "The hostname must be different from the default value.";
    }
  ];
}
