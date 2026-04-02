{pkgs, ...}:
{
  programs.fzf = {
    enableFishIntegration = true;
    defaultCommand = "${pkgs.fd}/bin/fd --type file";
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type file";
  };
}
