{
	config,
	pkgs,
	inputs,
	...
}: {
	programs.helix = {
		enable = true;
		settings = {
			theme = "catppuccin_frappe_transparent";
			editor = {
				lsp.display-messages = true;
			};
		};
		themes = {
			catppuccin_frappe_transparent = {
				"inherits" = "catppuccin_frappe";
				"ui.backround" = "{}";
			};
		};
	};
}
