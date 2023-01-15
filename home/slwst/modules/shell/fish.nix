{
	config,
	lib,
	pkgs,
	...
}: {
	programs.fish = {
		enable = true;
		shellAliases = {
			cat = "bat";
			ssh = "kitty +kitten ssh";
		};
	};
}
