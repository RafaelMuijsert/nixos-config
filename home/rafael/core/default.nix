{
  inputs,
  pkgs,
  pathUtils,
  ...
}: {
  # Configure home-manager.
  home-manager.users.rafael = {
    home = {
      username = "rafael";
      homeDirectory = "/home/rafael";
      stateVersion = "24.05";
      packages = with pkgs; [
        fishPlugins.hydro
        (nerdfonts.override {fonts = ["CascadiaCode" "Terminus"];})
      ];
    };
    # Define programs to be enabled for this user across all hosts.
    programs = {
      bat.enable = true;
      btop.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      home-manager.enable = true;
      fish.enable = true;
      fzf.enable = true;
      git.enable = true;
      helix.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };
  };
}
