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
	systemd.user.targets.tray = {
		Unit = {
			Description = "Home Manager System Tray";
			Requires = [ "graphical-session-pre.target" ];
		};
	};
}
