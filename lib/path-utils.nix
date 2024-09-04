{
  readDirectory = dir: builtins.map(file: toString dir + "/${file}") (builtins.attrNames (builtins.readDir dir));
}
