{pkgs, ...}: {
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      cat = "bat";
      qr = "${pkgs.qrtool}/bin/qrtool encode -t terminal";
    };
  };
}
