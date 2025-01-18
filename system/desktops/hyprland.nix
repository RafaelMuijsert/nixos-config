{
  options,
  lib,
  config,
  ...
}: {
  # Implement options.
  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland = {
      enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    services.gnome.gnome-keyring.enable = true;
    services.xserver.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
