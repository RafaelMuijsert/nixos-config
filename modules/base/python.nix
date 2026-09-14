{
  den.default.homeManager = { pkgs, pkgs-unstable, ... }: {
    home.packages = [
      (pkgs.python3.withPackages (ppkgs: [
        ppkgs.jupyter
        ppkgs.numpy
      ]))
      pkgs-unstable.uv
    ];

    programs.helix.languages = {
      language = [{
        name = "python"; 
        auto-format = true;
        formatter = let
          pythonFormat = pkgs.writeShellApplication {
            name = "hx-python-format";
            text = ''
              #!/bin/sh
              ${pkgs-unstable.ruff}/bin/ruff check --select ALL --fix -e -s - |
              ${pkgs-unstable.ruff}/bin/ruff format -
            '';
          };
        in {
          command = "${pythonFormat}/bin/hx-python-format"; 
        };
        language-servers = [
          { name = "ruff-lsp"; }
          { name = "pyrefly"; }
        ];
      }];
      language-server.ruff-lsp = {
        command = "${pkgs-unstable.ruff}/bin/ruff";
        args = ["server"];
        config.settings.lint.select = ["ALL"];
      };
      language-server.pyrefly = {
        command = "${pkgs-unstable.pyrefly}/bin/pyrefly";
        args = ["lsp"];
      };
    };
  };
}
