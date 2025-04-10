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
      ppkgs.opencv-python
      ppkgs.pandas
      ppkgs.pytest
      ppkgs.pytorch
      ppkgs.scikit-image
      ppkgs.scipy
      ppkgs.transformers
      ppkgs.wget
    ]))
  ];
}
