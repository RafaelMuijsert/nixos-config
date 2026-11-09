let
  port = 9433;
  subdomain = "finances";
in
{
  den.aspects.services.actual = {
    webServices.internal.${subdomain}.port = port;
    nixos.services.actual = {
      enable = true;
      settings = {
        inherit port;
      };
    };
  };
}
