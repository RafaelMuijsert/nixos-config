# List available commands
default:
    @just --list

# Apply the configuration to the current system (persists across reboots)
switch:
    nh os switch

# Test the configuration without making it the boot default
test:
    nh os test

# Update all flake inputs to their latest versions
update:
    nix flake update
