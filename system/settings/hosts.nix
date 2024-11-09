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
    0.0.0.0 tweakers.net
  '';
}
