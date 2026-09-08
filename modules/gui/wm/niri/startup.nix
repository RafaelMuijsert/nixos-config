{
  den.ful.wm.niri.homeManager = { pkgs, ... }: {
    programs.niri.settings.spawn-at-startup = [
      {
        command = [ "noctalia" ];
      }
      {
        command = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ];
      }
    ];
  };
}
