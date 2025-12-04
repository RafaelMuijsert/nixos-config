{
  lib,
  osConfig,
  ...
}: {
  programs.kitty = {
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
    settings = {
      shell = "zellij -l welcome";
    };
  };
}
