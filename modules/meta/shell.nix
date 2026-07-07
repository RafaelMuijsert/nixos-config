{
  perSystem = { pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        age
        just
        sops
      ];
    };
  };
}
