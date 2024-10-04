{ inputs, ... }: {
  nixpkgs-unstable = final: _prev: {
    nixpkgs-unstable = import inputs.nixpkgs-unstable {
      system = final.system;
    };
  };
}
