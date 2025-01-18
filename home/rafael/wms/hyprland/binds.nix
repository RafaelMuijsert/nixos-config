{
  pkgs,
  pkgs-unstable,
  ...
}: {
  wayland.windowManager.hyprland.settings =
    let
      wmScripts = import ../common/scripts.nix { inherit pkgs; };
      modifier = "ALT";
      secondaryModifier = "SUPER";
    in {
      "$mod" = "${modifier}";
      bind = [
        # Move focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        # Move window
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Kill active window
        "$mod SHIFT, q, killactive, "

        # Fullscreen active window
        "$mod, F, fullscreen"

        # "$mod, return, exec, $TERMINAL"
        "$mod, return, exec, kitty"
        "$mod, space, exec, $LAUNCHER"
        "$mod, I, exec, $BROWSER"

        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"


        ",Print, exec, ${wmScripts.scScreenshot}/bin/sc-screenshot"
        "Shift, Print, exec, ${wmScripts.scToggleRecording}/bin/sc-toggle-recording"

        # Use Logo + V for clipboard history.
        "${secondaryModifier}, v, exec, ${wmScripts.scClipboardHistory}/bin/sc-clipboard"

        # Lock the screen
        "${secondaryModifier}, x, exec, ${pkgs-unstable.hyprlock}/bin/hyprlock"

        "${secondaryModifier}, r, exec, ${wmScripts.scToggleRadio}/bin/sc-toggle-radio"
      ];
      binde = [
        ",XF86AudioRaiseVolume, exec, ${wmScripts.scSetVolume}/bin/sc-set-volume 1%+"
        ",XF86AudioLowerVolume, exec, ${wmScripts.scSetVolume}/bin/sc-set-volume 1%-"

        ",XF86MonBrightnessUp, exec, ${wmScripts.scSetBrightness}/bin/sc-set-brightness 1%+"
        ",XF86MonBrightnessDown, exec, ${wmScripts.scSetBrightness}/bin/sc-set-brightness 1%-"       
      ];
      bindl = [
        ",switch:off:Lid Switch, exec, hyprctl keyword monitor eDP-1,enable"
        ",switch:on:Lid Switch, exec, hyprctl keyword monitor eDP-1,disable"
      ];

      # Mouse binds
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
}
