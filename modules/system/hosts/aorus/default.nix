{ __findFile, ... }:
let
  hostname = "aorus";
in
{
  # Define host
  den.hosts.x86_64-linux.${hostname} = {
    users = {
      rafael = { };
    };
    theme = {
      scheme = ../../../theme/catppuccin/scheme.yaml;
      polarity = "dark";
      wallpaper = ../../../theme/catppuccin/wallpaper.png;
    };
  };

  den.aspects.${hostname} = {
    includes = [
      <desktop/niri>
      <theme/catppuccin>  

      <hardware/secureboot>
      # <net/home-vpn>
      <sync>
    ];

    homeManager = { config, ... }: {
      home.file = {
        "Downloads".source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/Downloads";
      };
    };

    nixos = {
      # udev rules to prevent suspend wakeups from motherboard and mouse usb receiver
      services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1022", ATTR{device}=="0x1483", ATTR{power/wakeup}="disabled"
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1022", ATTR{device}=="0x149c", ATTR{power/wakeup}="disabled"
      '';
      # Suspend when power button is pressed
      services.logind.settings.Login = {
        HandlePowerKey = "suspend";
        IdleAction = "suspend";
        IdleActionSec = 600;
      };
    };
  };
}
