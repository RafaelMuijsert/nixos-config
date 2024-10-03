{
  programs.helix = {
    defaultEditor = true;
    settings = {
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
    languages = {
      language = [
        {
          name = "c";
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
      ];
    };
  };
}
