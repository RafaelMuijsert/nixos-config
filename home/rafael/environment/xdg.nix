{ lib, ... }:
{
  home.sessionVariables = rec {
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    TLDR_CACHE_DIR = "${XDG_CACHE_HOME}/tldr";
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    GNUPGHOME = lib.mkForce "${XDG_DATA_HOME}/gnupg";
    GTK2_RC_FILES = lib.mkForce "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc";
    IPYTHONDIR = "${XDG_CONFIG_HOME}/ipython";
    JUPYTER_CONFIG_DIR = "${XDG_CONFIG_HOME}/jupyter";
    DVDCSS_CACHE = "${XDG_DATA_HOME}/dvdcss";
    MPLAYER_HOME = "${XDG_CONFIG_HOME}/mplayer";
  };
}
