{lib, ...}: {
  programs.kitty = {
    font.name = "CaskaydiaCove Nerd Font Mono";
    font.size = 14;
    shellIntegration.enableFishIntegration = true;
  };
}
