{
  programs.git = {
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      user.name = "Rafael Alexander Muijsert";
      user.email = "rafael@muijsert.org";
      init.defaultBranch = "main";
    };
  };
}
