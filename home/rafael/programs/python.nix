{ pkgs, ... }: {
  home.packages = [
    (pkgs.python313.withPackages (ppkgs: [
      ppkgs.geopandas
      ppkgs.graphviz
      ppkgs.imageio
      ppkgs.jupyter
      ppkgs.matplotlib
      ppkgs.networkx
      ppkgs.numpy
      ppkgs.ollama
      ppkgs.ortools
      ppkgs.opencv-python
      ppkgs.pandas
      ppkgs.pytest
      # ppkgs.pytorch
      ppkgs.scikit-image
      ppkgs.scipy
      # ppkgs.torchvision
      ppkgs.transformers
      ppkgs.wget
      ppkgs.z3-solver
    ]))
  ];
}
