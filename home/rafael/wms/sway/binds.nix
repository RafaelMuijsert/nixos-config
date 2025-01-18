{
  config,
  lib,
  osConfig,
  pkgs,
  pkgs-unstable,
  ...
}: {
  wayland.windowManager.sway = {
    config.keybindings = let
      modifier = config.wayland.windowManager.sway.config.modifier;
      secondaryModifier = "Mod4";
      wmScripts = import ../common/scripts.nix { inherit pkgs; };
    in {
      "${modifier}+Return" = "exec $TERMINAL";
      "${modifier}+Shift+q" = "kill";
      "${modifier}+space" = "exec $LAUNCHER";
      "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Do you want to exit Sway?' -b 'Yes' 'swaymsg exit'";
      "${modifier}+i" = "exec $BROWSER";

      "XF86AudioRaiseVolume" = "exec ${wmScripts.scSetVolume}/bin/sc-set-volume 1%+";
      "XF86AudioLowerVolume" = "exec ${wmScripts.scSetVolume}/bin/sc-set-volume 1%-";
      "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      "XF86MonBrightnessUp" = "exec ${wmScripts.scSetBrightness}/bin/sc-set-brightness 1%+";
      "XF86MonBrightnessDown" = "exec ${wmScripts.scSetBrightness}/bin/sc-set-brightness 1%-";

      "Print" = "exec ${wmScripts.scScreenshot}/bin/sc-screenshot";
      "Shift+Print" = "exec ${wmScripts.scToggleRecording}/bin/sc-toggle-recording";

      # Use Logo + V for clipboard history.
      "${secondaryModifier}+v" = "exec ${wmScripts.scClipboardHistory}/bin/sc-clipboard";

      # Lock the screen
      "${secondaryModifier}+x" = "exec ${pkgs-unstable.hyprlock}/bin/hyprlock";

      "${secondaryModifier}+r" = "exec ${wmScripts.scToggleRadio}/bin/sc-toggle-radio";

      "${modifier}+1" = "workspace number 1";
      "${modifier}+2" = "workspace number 2";
      "${modifier}+3" = "workspace number 3";
      "${modifier}+4" = "workspace number 4";
      "${modifier}+5" = "workspace number 5";
      "${modifier}+6" = "workspace number 6";
      "${modifier}+7" = "workspace number 7";
      "${modifier}+8" = "workspace number 8";
      "${modifier}+9" = "workspace number 9";
      "${modifier}+0" = "workspace number 10";

      "${modifier}+comma" = "workspace back_and_forth";

      "${modifier}+Shift+1" = "move container to workspace number 1";
      "${modifier}+Shift+2" = "move container to workspace number 2";
      "${modifier}+Shift+3" = "move container to workspace number 3";
      "${modifier}+Shift+4" = "move container to workspace number 4";
      "${modifier}+Shift+5" = "move container to workspace number 5";
      "${modifier}+Shift+6" = "move container to workspace number 6";
      "${modifier}+Shift+7" = "move container to workspace number 7";
      "${modifier}+Shift+8" = "move container to workspace number 8";
      "${modifier}+Shift+9" = "move container to workspace number 9";
      "${modifier}+Shift+0" = "move container to workspace number 10";

      "${modifier}+f" = "fullscreen toggle";
      "${modifier}+t" = "floating toggle";
      "${modifier}+v" = "split vertical";
      "${modifier}+b" = "split horizontal";
      "${modifier}+x" = "split toggle";

      "${secondaryModifier}+h" = "resize grow left 8px";
      "${secondaryModifier}+j" = "resize grow down 8px";
      "${secondaryModifier}+k" = "resize grow up 8px";
      "${secondaryModifier}+l" = "resize grow right 8px";

      "${secondaryModifier}+Shift+h" = "resize shrink right 8px";
      "${secondaryModifier}+Shift+j" = "resize shrink up 8px";
      "${secondaryModifier}+Shift+k" = "resize shrink down 8px";
      "${secondaryModifier}+Shift+l" = "resize shrink left 8px";

      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+l" = "focus right";

      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+l" = "move right";
    };
    config.defaultWorkspace = "workspace number 1";
  };
}
