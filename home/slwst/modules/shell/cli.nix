{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    fd
    nnn
    ripgrep
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    tealdeer = {
      enable = true;
      settings = {
        display = {
          compact = false;
          use_pager = true;
        };
        updates = {
          auto_update = true;
        };
      };
    };
    bat = {
      enable = true;
      themes = {
        Catppuccin-frappe = builtins.readFile (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "bat";
            rev = "00bd462e8fab5f74490335dcf881ebe7784d23fa";
            sha256 = "yzn+1IXxQaKcCK7fBdjtVohns0kbN+gcqbWVE4Bx7G8=";
          }
        + "/Catppuccin-frappe.tmTheme");
      };
      config.theme = "Catppuccin-frappe";
    };
  };
}
