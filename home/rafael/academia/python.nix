{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.numpy
      ppkgs.imageio
      ppkgs.jupyter
      ppkgs.pandas
      ppkgs.matplotlib
      ppkgs.networkx
      ppkgs.scipy
    ]))
  ];
}
