{ den, ... }:
{
  den.aspects.desktop.niri = {
    includes = with den.aspects; [
      wm.niri
      shell.noctalia

      audio.pipewire
      browser.firefox
      terminal.kitty
      documents.zathura
      email.thunderbird
      video.mpv
      image.imv
      music.rmpc

      security.keyring
      security.pam
      security.polkit
    ];

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        signal-desktop
        telegram-desktop
      ];
    };
    # nixos = { pkgs, ... }: {
    # https://github.com/bitwarden/clients/issues/21661
    # environment.systemPackages = [ pkgs.bitwarden-desktop ];
    # };
  };
}
