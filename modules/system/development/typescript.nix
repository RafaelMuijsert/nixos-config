{
  den.default.homeManager = { pkgs-unstable, ... }: {
    programs.helix.languages = {
      language = [{
        name = "tsx"; 
        formatter = {
          command = "${pkgs-unstable.biome}/bin/biome";
          args = ["format" "--stdin-file-path" "index.js"];
        };
        auto-format = true;
      }];
    };
  };
}
