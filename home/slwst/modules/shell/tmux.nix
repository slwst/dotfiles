{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    terminal = "xterm-256color";
    extraConfig = ''
      set -ag terminal-overrides ",$TERM:RGB"
    '';
    #plugins = [ ];
  };
}
