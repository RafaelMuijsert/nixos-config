{ pkgs, ... }:
{
  scSetVolume = pkgs.writeShellApplication {
    name = "sc-set-volume";
    text = ''
      #!/bin/sh
      wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"
      volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%%", $2 * 100}')
      ${pkgs.libnotify}/bin/notify-send -t 3000 -h "int:value:$volume" -h string:x-canonical-private-synchronous:volume "Volume" "$volume"
    '';
  };
  scToggleRadio = pkgs.writeShellApplication {
    name = "sc-toggle-radio";
    text = ''
      #!/bin/sh

      RADIO_URL='https://icecast.omroep.nl/radio4-eigentijdsfb-aac.m3u'
      # Toggle radio
      pkill -f "mpv.*$RADIO_URL" || ${pkgs.mpv}/bin/mpv "$RADIO_URL";
    '';
  };
  scSetBrightness = pkgs.writeShellApplication {
    name = "sc-set-brightness";
    text = ''
      #!/bin/sh
      brightness=$(${pkgs.brightnessctl}/bin/brightnessctl set "$1" | grep -oP '\(\K\d+%')
      ${pkgs.libnotify}/bin/notify-send -t 3000 -h "int:value:$brightness" -h string:x-canonical-private-synchronous:brightness "Brightness" "$brightness"
    '';
  };
  scScreenshot = pkgs.writeShellApplication {
    name = "sc-screenshot";
    text = ''
      #!/bin/sh
      ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$HOME/Pictures/Screenshots/$(date +%s).png"
    '';
  };
  scClipboardHistory = pkgs.writeShellApplication {
    name = "sc-clipboard";
    text = ''
      #!/bin/sh
      exec ${pkgs.cliphist}/bin/cliphist list |
      ${pkgs.fuzzel}/bin/fuzzel --dmenu |
      ${pkgs.cliphist}/bin/cliphist decode |
      ${pkgs.wl-clipboard}/bin/wl-copy
    '';
  };
  scToggleRecording = pkgs.writeShellApplication {
    name = "sc-toggle-recording";
    text = ''
      #!/bin/sh

      # Try to stop the recording first
      if pkill --signal INT wf-recorder; then
          pkill -SIGRTMIN+4 i3status-rs
          ${pkgs.libnotify}/bin/notify-send -t 3000 "Screen recorder" "Recording stopped"
      else
          # If stopping fails, start a new recording
          ${pkgs.libnotify}/bin/notify-send -t 3000 "Screen recorder" "Recording started"
          ${pkgs.wf-recorder}/bin/wf-recorder -f "$HOME/Videos/Recordings/$(date +%s).mp4" &
          pkill -SIGRTMIN+4 i3status-rs
      fi
    '';
  };
}
