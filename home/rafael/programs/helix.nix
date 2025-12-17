{
  osConfig,
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.helix = {
    package = pkgs-unstable.helix;
    defaultEditor = true;
    settings = {
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        inline-diagnostics = {
          cursor-line = "hint";
        };
      };
      theme = (osConfig.desktop.theme or {}).helixTheme or "catppuccin_mocha";
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
          name = "typst";
          formatter.command = "${pkgs.typstyle}/bin/typstyle";
          auto-format = true;
        }
        {
          name = "php";
          scope = "source.php";
          injection-regex = "php";
          file-types = ["php" "inc" "php4" "php5" "phtml" "ctp"];
          shebangs = ["php"];
          roots = ["composer.json" "index.php"];
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
            {name = "ruff-lsp";}
            {name = "ty";}
          ];
        }
        {
          name = "tsx";
          roots = ["package-lock.json" "tsconfig.json" ".prettierrc.json"];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--stdin-filepath" "index.tsx"];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          roots = ["package-lock.json" "tsconfig.json" ".prettierrc.json"];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--stdin-filepath" "index.ts"];
          };
          auto-format = true;
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
      language-server.ty = {
        command = "${pkgs-unstable.ty}/bin/ty";
        args = ["server"];
      };
      language-server.phpactor = {
        command = "${pkgs-unstable.phpactor}/bin/phpactor";
        args = ["language-server"];
      };
      language-server.tinymist = {
        command = "${pkgs-unstable.tinymist}/bin/tinymist";
        config = {
          exportPdf = "onSave";
          outputPath = "$root/$name";
          preview.background.enabled = true;
          preview.background.args = [
            "--data-plane-host=127.0.0.1:0"
            "--open"
          ];
        };
      };
    };
  };
}
