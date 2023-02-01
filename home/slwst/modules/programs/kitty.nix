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

      # Tabs
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      # Display
      sync_to_monitor = true;
    };
    theme = "Catppuccin-Frappe";
  };
}
