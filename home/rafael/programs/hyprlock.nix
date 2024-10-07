{ pkgs, ... }:
{
  programs.hyprlock = {
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "400, 100";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          font_family = "monospace";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 2;
          placeholder_text = ''<span foreground="##cad3f5">Enter your password</span>'';
          shadow_passes = 2;
        }
      ];
      label = [
        {
          monitor = "";
          text = ''cmd[update:0] echo "$(date +"%A, %B %d")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = "48";
          font_family = "monospace";
          position = "0, 300";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = "192";
          font_family = "monospace";
          position = "0, 0";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
        }
        {
          monitor = "";
          text = ''cmd[update:0] ${pkgs.fortune}/bin/fortune -s'';
          text_align = "center";
          font_family = "monospace";
          halign = "center";
          valign = "bottom";
          font_size = "24";
          position = "0, 0";
          shadow_passes = 2;
        }
      ];
    };
  };
}
