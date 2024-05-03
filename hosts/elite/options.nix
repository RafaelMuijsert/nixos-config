{lib, ...}: {
  options = {
    hostUsers = lib.mkOption {
      type = "list";
      default = [];
      example = ["rafael" "joe"];
      description = "A list of the hosts' users";
    };
    hostModules = lib.mkOption {
      type = "list";
      default = [];
      example = ["boot/systemd.nix"];
      description = "A list of the hosts' modules";
    };
  };
}
