{
	config,
	lib,
	pkgs,
	...
}: {
	programs.fish = {
		enable = true;
		loginShellInit = ''
			eval (ssh-agent -c)
		'';
	};
}
