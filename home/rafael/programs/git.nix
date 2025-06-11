{
  programs.git = {
    userName = "Rafael Alexander Muijsert";
    userEmail = "rafael@muijsert.org";

    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
