{
	pkgs, ...
}:{
	home = {
		packages = with pkgs; [
			alejandra
		];
	};
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
 #   enableFishIntegration = true;
  };
}
