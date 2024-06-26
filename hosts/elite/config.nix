{
  # Import available options.
  imports = [./options.nix];

  # Define the hosts' users.
  hostUsers = ["rafael"];

  # Define the hosts' modules.
  hostModules = [
    "boot/systemd.nix"
    "shells/fish.nix"
    "network/networkmanager.nix"
    "common/development.nix"
    "common/graphics.nix"
    "graphics/wm/i3.nix"
    "graphics/login/lightdm.nix"
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
