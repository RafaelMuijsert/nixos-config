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
          name = "php";
          scope = "source.php";
          injection-regex = "php";
          file-types = ["php" "inc" "php4" "php5" "phtml" "ctp"];
          shebangs = ["php"];
          roots = [ "composer.json" "index.php" ];
          comment-token = "//";
          language-servers = [
            {
              name = "phpactor";
            }
          ];
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
                ${pkgs-unstable.ruff}/bin/ruff format -
              '';
            };
          in {
            command = "${pythonFormat}/bin/hx-python-format";
          };
          language-servers = [
            {
              name = "ruff-lsp";
            }
            {
              name = "basedpyright";
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
      language-server.basedpyright = {
        command = "${pkgs-unstable.basedpyright}/bin/basedpyright-langserver";
        args = ["--stdio"];
        config = {
          basedpyright.analysis.diagnosticMode = "openFilesOnly";
        };
      };
      language-server.phpactor = {
        command = "${pkgs-unstable.phpactor}/bin/phpactor";
        args = [ "language-server"];
      };
    };
  };
}
