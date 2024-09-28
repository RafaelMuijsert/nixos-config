{
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    use-xdg-base-directories = true;
    accept-flake-config = true;
  };
  programs.command-not-found.enable = false;
}
