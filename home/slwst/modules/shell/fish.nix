{
	config,
	lib,
	pkgs,
	...
}: {
	programs.fish = {
		enable = true;
		functions = {
			gitignore = "curl -sL https://gitignore.io/api/$argv";
			starship_transient_prompt_func = "starship module character";
			starship_transient_rprompt_func = "starship module time";
		};
		shellAliases = {
			cat = "bat";
			ssh = "kitty +kitten ssh";
			newbg = "systemctl --user start feh-random-bg";
		};
		interactiveShellInit = ''
			# enable transient prompt with starship
	    bind \r transient_execute
		'';
		plugins = [
			{
				name = "colored-man-pages";
				src = pkgs.fetchFromGitHub {
					owner = "PatrickF1";
					repo = "colored_man_pages.fish";
					rev = "f885c2507128b70d6c41b043070a8f399988bc7a";
					sha256 = "ii9gdBPlC1/P1N9xJzqomrkyDqIdTg+iCg0mwNVq2EU=";
				};
			}
		];
	};
  home.packages = with pkgs; [
    fishPlugins.sponge
		fishPlugins.fzf-fish
		fishPlugins.forgit
  ];
}
