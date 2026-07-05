{ inputs, lib, ...}:
{
  flake-file.inputs = {
    stylix.url = "github:danth/stylix/release-26.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.stylix = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];
      stylix = {
        enable = true;
        base16Scheme = ../../../_legacy/themes/catppuccin-nix/scheme.yaml;
        polarity = "dark";
        cursor = {
          package = pkgs.whitesur-cursors;
          name = "WhiteSur-cursors";
          size = 24;
        };
        fonts = {
          serif = {
            package = pkgs.nerd-fonts.arimo;
            name = "Arimo Nerd Font";
          };

          sansSerif = {
            package = pkgs.nerd-fonts.arimo;
            name = "Arimo Nerd Font";
          };

          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = lib.mkDefault "JetBrainsMono Nerd Font Mono";
          };

          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
          sizes.popups = 12;
          sizes.desktop = 12;
        };
      };
    };
  };
}
