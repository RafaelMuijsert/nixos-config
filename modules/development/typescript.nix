{
  den.aspects.development.typescript.homeManager = { pkgs-unstable, ... }: {
    programs.helix = {
      extraPackages = with pkgs-unstable; [ typescript-language-server ];
      languages = {
        language = [
          {
            name = "tsx";
            formatter = {
              command = "${pkgs-unstable.biome}/bin/biome";
              args = [
                "format"
                "--stdin-file-path"
                "index.tsx"
              ];
            };
            auto-format = true;
          }
        ];
      };
    };
  };
}
