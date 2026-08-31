{
  den.ful.academia.typst.homeManager = { pkgs, pkgs-unstable, ... }: {
    programs.helix.languages = {
      language = [
        {
          name = "typst";
          formatter.command = "${pkgs.typstyle}/bin/typstyle";  
          auto-format = true;
        }
      ];
      language-server = {
        tinymist = {
          command = "${pkgs-unstable.tinymist}/bin/tinymist";
          config = {
            preview.background = {
              enabled = true;
              args = [
                "--data-plane-host=127.0.0.1:0"
                "--open"
              ];
            };
          };
        };
      };
    };
  };
}
