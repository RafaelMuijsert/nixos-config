HOST := elite

.PHONY: build
build:
	nixos-rebuild --flake ".?submodules=1#${HOST}" build

.PHONY: switch
switch:
	nixos-rebuild --flake ".?submodules=1#${HOST}" switch

