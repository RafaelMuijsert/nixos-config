let
  port = 9433;
  subdomain = "finances";
in {
  den.ful.services.actual = {
    webServices.internal.${subdomain}.port = port;
    nixos.services.actual = {
      enable = true;
      settings = {
        inherit port;
      };
    };
  };
}
