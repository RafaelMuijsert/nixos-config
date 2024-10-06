{pkgs, ...}: {
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
      set pure_enable_single_line_prompt true
    '';
    shellAliases = {
      cat = "bat";
      qr = "${pkgs.qrtool}/bin/qrtool encode -t terminal";
    };
  };
}
