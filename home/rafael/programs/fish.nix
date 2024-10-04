{ pkgs, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      cat = "bat";
    };
    functions = {
      qr = "${pkgs.qrtool}/bin/qrtool encode -t terminal \"$argv\"";
    };
  };
}
