{
  options,
  lib,
  config,
  pkgs,
  ...
}: {
  # Implement options.
  config = lib.mkIf config.desktop.niri.enable {
    programs.niri = {
      package = pkgs.niri;
      enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    # services.gnome.gnome-keyring.enable = false;
    stylix.enable = true;
  };
}
