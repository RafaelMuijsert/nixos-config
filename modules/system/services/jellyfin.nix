let
  group = "media";
  port = 8096;
in {
  den.ful.services.jellyfin = {
    webServices.external.media.port = port;

    nixos = { lib, pkgs, pkgs-unstable, ... }: {
      users.groups.${group} = {};

      systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD";
      environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
      };
      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-compute-runtime
        ];
      };
      services.jellyfin = {
        enable = true;
        inherit group;
        hardwareAcceleration = {
          enable = true;
          device = "/dev/dri/renderD128";
          type = "vaapi";
        };
        package = pkgs-unstable.jellyfin;
        transcoding = {
          enableHardwareEncoding = true;
        };
      };
      users.users.jellyfin.extraGroups = [ "video" "render" ];
    };
  };
}
