{
  den.ful.services.jellyfin.nixos = {
    systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD";
    environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "intel-ocl"
    ];
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-ocl
        intel-media-driver  
      ];
    };
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      hardwareAcceleration = {
        enable = true;
        device = "/dev/dri/renderD128";
        type = "vaapi";
      };
      transcoding = {
        enableHardwareEncoding = true;
      };
    };
  };
}
