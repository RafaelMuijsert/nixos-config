{
  # Define the hosts' users.
  hostUsers = ["rafael"];

  # Define the hosts' modules.
  hostModules = [
    "boot/systemd.nix"
  ];

  # Set time zone.
  time.timeZone = "Europe/Amsterdam";

  # Set default locale.
  i18n.defaultLocale = "en_US.UTF-8";

  # Set the system hostname
  networking.hostName = "elite";

  # Set state version.
  system.stateVersion = "24.05";
}
