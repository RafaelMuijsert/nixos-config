{
  options,
  lib,
  config,
  ...
}: {
  # Implement options.
  config = lib.mkIf config.desktop.sway-minimal.enable {
    programs.sway = {
      enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    services.gnome.gnome-keyring.enable = true;
  };
}
