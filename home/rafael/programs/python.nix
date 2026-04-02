{pkgs, pkgs-unstable, ...}: {
  home.packages = [
    (pkgs.python313.withPackages (ppkgs: with ppkgs; [
      geopandas
      graphviz
      imageio
      jupyter
      matplotlib
      networkx
      numpy
      ollama
      ortools
      opencv-python
      pandas
      polars
      pytest
      scikit-image
      scipy
      sympy
      torchvision
      transformers
      wget
      z3-solver
    ]))
    pkgs-unstable.uv
  ];
}
