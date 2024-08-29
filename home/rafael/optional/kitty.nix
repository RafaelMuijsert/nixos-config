{lib, ...}: {
  programs.kitty = {
    font.name = "Terminess Nerd Font Mono";
    font.size = 9;
    shellIntegration.enableFishIntegration = true;
  };
}
