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
  home.sessionVariables = {
    pure_symbol_prompt = "λ";
    pure_enable_single_line_prompt = "true";
  };
}
