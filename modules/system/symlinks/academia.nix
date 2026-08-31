let
  symlinkName = "Uni";
in {
  den.ful.academia.symlink.homeManager = { config, ... }: {
    home.file.${symlinkName}.source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Documents/Academia/MSc-Computer-Science/Year-1/Semester-1";
  };
}
