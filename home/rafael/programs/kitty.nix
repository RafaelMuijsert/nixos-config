{
  lib,
  osConfig,
  ...
}:  {
  programs.kitty = {
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
  };
}
