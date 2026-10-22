{ pkgs, ... }:
{
  env = {
    NH_FLAKE = "./.";
  };
  # Various Git hooks to avoid common mistakes
  git-hooks.hooks = {
    # Check for merge conflicts
    check-merge-conflicts.enable = true;
    # Check for broken symlinks
    check-symlinks.enable = true;
    # Check for unused Nix code
    deadnix = {
      enable = true;
      settings.noUnderscore = true;
    };
    # Detect private keys
    detect-private-keys.enable = true;
    # Ensure every non-empty file ends in a newline
    end-of-file-fixer.enable = true;
    # Check markdown file syntax
    markdownlint.enable = true;
    # Format Nix files
    nixfmt.enable = true;
    # Nix linter
    statix.enable = true;
    # Check for typos
    typos.enable = true;
  };

  packages = with pkgs; [
    age
    just
    nh
    sops
  ];
}
