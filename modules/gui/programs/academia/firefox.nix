{
  den.ful.academia.typst.homeManager = { pkgs, ... }: {
    home.packages = [ pkgs.tinymist ];
    programs.helix.languages.language = [
      {
        name = "typst";
        formatter.command = "${pkgs.typstyle}/bin/typstyle";  
        auto-format = true;
      }
    ];
  };
}
