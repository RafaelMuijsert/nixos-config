{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.ollama
      ppkgs.numpy
      ppkgs.imageio
      ppkgs.graphviz
      ppkgs.jupyter
      ppkgs.pandas
      ppkgs.matplotlib
      ppkgs.networkx
      ppkgs.pytest
      ppkgs.scipy
      ppkgs.transformers
    ]))
  ];
}
