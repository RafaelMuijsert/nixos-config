{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      theme = "base16_default";
    };
    languages = {
      language = [{
        name = "c";
        indent = { tab-width = 4; unit = "    "; };
      }];
    };
  };
}
