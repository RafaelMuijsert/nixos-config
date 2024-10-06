switch:
    sudo nixos-rebuild --flake . switch

test:
    sudo nixos-rebuild --flake . test

update:
    nix flake update
