{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      # Window
      background_opacity = "0.8";
      scrollback_lines = 10000;
      window_padding_width = 6;
    };
    theme = "Catppuccin-Frappe";
  };
}
