{ config
, pkgs
, inputs
, ...
}: {
  services.polybar = {
    enable = true;
    config = ./polybar-config;
    script = "polybar top &";
    extraConfig = builtins.readFile (pkgs.fetchFromGitHub
      {
        owner = "catppuccin";
        repo = "polybar";
        rev = "9ee66f83335404186ce979bac32fcf3cd047396a";
        sha256 = "bUbSgMg/sa2faeEUZo80GNmhOX3wn2jLzfA9neF8ERA=";
      } + "/themes/frappe.ini");
  };

  # startup w/ i3
  xsession.windowManager.i3.config.startup = [
    { command = "systemctl --user restart polybar"; always = true; notification = false; }
  ];
}
