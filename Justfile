# List available options
default:
    @just --list

# Rebuild and switch configuration matching hostname (persists beteween reboots)
switch:
    sudo nixos-rebuild --flake . switch

# Rebuild and test configuration matching hostname (does not persist between reboots)
test:
    sudo nixos-rebuild --flake . test

# Update flake inputs
update:
    nix flake update

