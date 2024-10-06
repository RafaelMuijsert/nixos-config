{
  config,
  lib,
  osConfig,
  ...
}: {
  # Create a symlink to the current semester in university.
  config = lib.mkIf osConfig.academia {
    home.file = {
      "Uni".source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/Documents/Academia/BSc-Computer-Science/Year 2/Semester 1";
    };
  };
}
