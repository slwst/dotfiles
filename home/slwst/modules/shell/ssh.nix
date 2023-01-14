{
	pkgs,
	lib,
	config,
	...
}:
{
	programs = {
		ssh = {
			enable = true;
			matchBlocks = {
				"github.com" = {
					hostname = "github.com";
					identityFile = "/etc/ssh/authorized_keys.d/slwst";
					identitiesOnly = true;
				};
			};
		};
	};
}
