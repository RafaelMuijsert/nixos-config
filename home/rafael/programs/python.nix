{ pkgs, ... }: {
  home.packages = [
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.graphviz
      ppkgs.imageio
      ppkgs.jupyter
      ppkgs.matplotlib
      ppkgs.networkx
      ppkgs.numpy
      ppkgs.ollama
      ppkgs.pandas
      ppkgs.pytest
      ppkgs.pytorch
      ppkgs.scipy
      ppkgs.transformers
    ]))
  ];
}
