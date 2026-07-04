{
  programs.eza = {
    enableFishIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--color=always"
      "--tree"
      "--level=1"
      "--group-directories-first"
      "--dereference"
    ];
  };
}
