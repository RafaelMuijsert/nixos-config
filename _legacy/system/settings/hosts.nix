{
  networking.stevenblack = {
    enable = true;
    block = [
      "fakenews"
      "gambling"
      "porn"
      "social"
    ];
  };
  # Time wasters
  networking.extraHosts = ''
    0.0.0.0 monkeytype.com
    0.0.0.0 typeracer.com
    0.0.0.0 play.typeracer.com
    0.0.0.0 tweakers.net
    0.0.0.0 instagram.com
    0.0.0.0 www.instagram.com
  '';
}
