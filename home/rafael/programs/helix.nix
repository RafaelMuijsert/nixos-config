{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.helix = {
    package = pkgs-unstable.helix;
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
        {
          name = "python";
          auto-format = true;
          formatter = let
            pythonFormat = pkgs.writeShellApplication {
              name = "hx-python-format";
              text = ''
                #!/bin/sh
                ${pkgs-unstable.ruff}/bin/ruff check --select ALL --fix -e -s - |
                ${pkgs-unstable.ruff}/bin/ruff format --line-length 79 -
              '';
            };
          in {
            command = "${pythonFormat}/bin/hx-python-format";
          };
          language-servers = [
            {
              name = "ruff-lsp";
            }
          ];
        }
      ];
      language-server.ruff-lsp = {
        command = "${pkgs-unstable.ruff}/bin/ruff";
        args = ["server" "--preview"];
        config = {
          settings = {
            lint = {
              # Python: Hard Mode
              select = ["ALL"];
            };
          };
        };
      };
    };
  };
}
